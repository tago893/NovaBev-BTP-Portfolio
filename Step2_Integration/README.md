# Step 2 — Integration (CPI iFlow + API Management + Event Mesh)

A live CPI iFlow that takes a NovaBev order and forwards it to a logistics partner endpoint, secured with OAuth2 client-credentials. An API Management proxy with Spike Arrest + Verify API Key policies, an API Product, and a consumer Application — full design and policy stack. A pub/sub StockLow event design on SAP Event Mesh.

## Files

### iFlow

| File | What it shows |
|---|---|
| `02_iflow_design.png` | Visual iFlow: Sender → Content Modifier → Receiver |
| `02_iflow_editor.png` | `Order_To_Logistics` iFlow in the design editor |
| `02_iflow_started.png` | Manage Integration Content showing iFlow STARTED |
| `02_message_completed.png` | Monitor Message Processing with a Completed run |

### API Management

| File | What it shows |
|---|---|
| `02_api_mgmt_home.png` | API Management Configure tab — proxies + providers |
| `02_api_proxy_overview.png` | `NovaBev_Order_API` proxy overview, Status: Deployed |
| `02_api_proxy_endpoint.png` | Proxy Endpoint with default route rule → default target |
| `02_api_target_endpoint.png` | Target Endpoint URL pointing to the live iFlow |
| `02_api_resources.png` | Resources tab with `order` resource for all HTTP methods |
| `02_api_add_resources.png` | Add Resources dialog (Tag / Path / Operations) |
| `02_api_revisions.png` | Revisions tab showing Draft-4 deployed |
| `02_api_404_testconsole.png` | API Test Console output |
| `02_capabilities.png` | Integration Suite capability provisioning page |

### Documentation

| File | What it shows |
|---|---|
| `02_design_notes.md` | Build notes, policies stack, Event Mesh design |

## Resume language

Designed and operated SAP Integration Suite. Built a Cloud Integration iFlow (HTTPS sender, Content Modifier, HTTP receiver) secured with OAuth2 client-credentials, with proper CSRF token handling, and verified end-to-end delivery with SAP correlation IDs. Configured an API Management proxy with policies (Spike Arrest, Verify API Key), an API Product, and a consumer Application key. Designed a publish/subscribe Stock-Low event-driven flow on SAP Event Mesh with an AMQP-coupled CPI subscriber.
