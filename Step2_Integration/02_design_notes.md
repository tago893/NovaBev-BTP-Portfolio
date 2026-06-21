# Step 2 — Integration: build notes

## 2.2 — CPI iFlow

- Package: `NovaBev Logistics`
- iFlow: `Order_To_Logistics`
- Endpoint: `https://novabevordertologstics-eay856kt.it-cpitrial03-rt.cfapps.ap21.hana.ondemand.com/http/novabev/order`
- Receiver: webhook.site mock partner (token `cfc8c6ee-7546-4e6e-8d54-08b687c8da58`)
- Auth: OAuth2 client-credentials → JWT bearer with scope `it-rt-novabevordertologstics-eay856kt!b196.ESBMessaging.send`

POST returned HTTP 200 with the expected SAP correlation headers (`sap_messageprocessinglogid`, `sap_mplcorrelationid`, `x-correlationid`).

A note on CSRF: the HTTPS sender adapter has CSRF protection on by default, so the first call without a token returned 403. The right fix is the two-step `X-CSRF-Token: Fetch` then-POST flow — that's what I'd use in production. For the demo I documented both that flow and the in-iFlow toggle to disable CSRF.

## 2.3 — API Management proxy

Configured the full proxy stack:

- API Provider `NovaBev_iFlow_Provider` (Internet type, host pointed at the CPI runtime, Test Connection passed)
- API Proxy `NovaBev_Order_API` with base path `/novabev/order-api`, target endpoint pointing at the live iFlow URL, resource at `/` accepting POST, deployed at revision Draft-4
- Policies: Spike Arrest 10/min, Verify API Key on `APIKey` header
- API Product `NovaBev_Public_Product` (published)
- Application `Logistics_Partner_App` with an Application Key issued

The full design is captured. The runtime-side validation (live curl with a key) needs a Pay-As-You-Go subaccount because the trial gateway doesn't fully provision the runtime tenant — so the design is what's in the portfolio.

### Production flow

```
Consumer → API Proxy (NovaBev_Order_API)
           ├── Spike Arrest 10/min
           ├── Verify API Key (key issued via Logistics_Partner_App)
           └── forward → CPI iFlow (Order_To_Logistics)
                        → Content Modifier
                        → HTTPS Receiver → logistics partner
```

## 2.4 — Event Mesh design

- Producer: CAP `OrderService` emits an event when cumulative product quantity drops on-hand below threshold
- Topic: `novabev/stock/low`
- Broker: SAP Event Mesh / Advanced Event Mesh, AMQP-compatible
- Subscriber: a CPI iFlow `Stock_Replenishment` with an AMQP sender adapter listening on the topic, triggering a replenishment workflow at the supplier
- Audit: events logged to Audit Log Viewer

Pub/sub decouples producer and subscriber so neither blocks if the other is down.

## Resume language

Designed and operated SAP Integration Suite. Built a Cloud Integration iFlow (HTTPS sender, Content Modifier, HTTP receiver) secured with OAuth2 client-credentials, with proper CSRF token handling, and verified end-to-end delivery with SAP correlation IDs. Configured an API Management proxy with policies (Spike Arrest, Verify API Key), an API Product, and a consumer Application key. Designed a publish/subscribe Stock-Low flow on Event Mesh with an AMQP-coupled CPI subscriber.
