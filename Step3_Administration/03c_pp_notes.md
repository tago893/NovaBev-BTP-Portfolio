# Hybrid Connectivity & Principal Propagation — NovaBev Design

How SAP BTP Cloud Connector enables hybrid (cloud-to-on-prem) connectivity, and how principal propagation forwards the real user identity from a BTP-hosted Fiori app all the way to an on-prem SAP system without opening a single inbound firewall port.

Subaccount: NB-Dev (`5a8eaa03-5912-47b2-8cfc-7ff13255a5ae`)
Region: AWS US East
Reference: Build Bible Step 3, Exercise 3C; Figure 3.2.

---

## 1. The big picture

```
 ┌──────────────────────┐                    ┌─────────────────────────┐
 │  USER (browser)      │                    │  CORPORATE NETWORK      │
 │  varunch@pdx.edu     │                    │                         │
 │                      │                    │  ┌───────────────────┐  │
 │  IAS login + MFA     │                    │  │  Cloud Connector  │  │
 └─────────┬────────────┘                    │  │  (this Mac)       │  │
           │ 1. SAML/OIDC                    │  │  localhost:8443   │  │
           ▼                                 │  └─────────┬─────────┘  │
 ┌──────────────────────┐  3. invoke API     │            │            │
 │  Fiori app on BTP    │ ─────────────────► │            │ 5. tunnel  │
 │  (NovaBev order app  │  via OnPremise     │            │   forward  │
 │   in NB-Dev space)   │     destination    │            ▼            │
 │                      │ ◄───── 7. data ─── │  ┌───────────────────┐  │
 │  XSUAA token holds   │                    │  │  ON-PREM SYSTEM    │  │
 │  user identity       │                    │  │  (S/4HANA on-prem  │  │
 └─────────┬────────────┘                    │  │   or simulated)    │  │
           │ 2. JWT issued                   │  └───────────────────┘  │
           ▼                                 │  6. backend sees the    │
 ┌──────────────────────┐                    │     real user, not a    │
 │  XSUAA / IAS         │                    │     technical service   │
 └──────────────────────┘                    │     account             │
                                             └─────────────────────────┘

   Tunnel direction: outbound from corporate to BTP. Never inbound.
   Auth chain:       IAS (who) → XSUAA (what) → CC (forward) → backend (act-as)
```

---

## 2. Seven hops, in plain language

| # | What happens | Where |
|---|---|---|
| 1 | User opens NovaBev order app, gets challenged for credentials | Browser ↔ IAS |
| 2 | IAS authenticates (with MFA), federated trust returns identity to XSUAA, which issues a JWT carrying user id, scopes, and any role-collection attributes | XSUAA |
| 3 | Fiori app calls the OnPremise destination by name (`SAP_S4_NOVABEV`); the destination service injects the destination config into the outbound HTTP call | NB-Dev runtime |
| 4 | Destination is configured ProxyType `OnPremise` + Authentication `PrincipalPropagation`, so the connectivity service routes the request through the BTP connectivity proxy | BTP connectivity proxy |
| 5 | The connectivity proxy puts the request on the outbound tunnel that the Cloud Connector built from on-prem to BTP. Nothing inbound is opened on the corporate firewall | Tunnel |
| 6 | Cloud Connector receives the request inside the corporate network, looks up the virtual host in its Cloud-To-On-Premise mapping, exchanges the BTP-issued user assertion for a short-lived X.509 client certificate trusted by the backend, and replays the request as that user | Cloud Connector |
| 7 | The on-prem SAP system sees the real user (e.g. `varunch@pdx.edu` mapped to `BUYER_VARUNCH`), enforces its own authorizations, returns data | On-prem |

The data response travels back up the same outbound tunnel.

---

## 3. Why this is the secure design

Three properties this design delivers:

1. **No inbound ingress.** Outbound tunnel only — much smaller attack surface than a VPN or dedicated line.
2. **Whitelisted resources.** Only the virtual hosts and resource paths configured in the Cloud Connector's Cloud-To-On-Premise tab are reachable. Anything else is rejected at the connector before it touches the backend.
3. **Real-user audit.** Backend logs show `varunch@pdx.edu`, not a shared technical user — which is what compliance teams (SOX, HIPAA, GDPR) need to see.

---

## 4. The configuration NovaBev would deploy

### 4.1 — Cloud Connector → Cloud-To-On-Premise system mapping

| Setting | Value |
|---|---|
| Backend Type | `ABAP System` (S/4HANA on-prem) |
| Protocol | `HTTPS` |
| Internal Host | `s4nb01.corp.novabev.local` |
| Internal Port | `44300` |
| Virtual Host | `s4-novabev` |
| Virtual Port | `443` |
| Principal Type | `X.509 Certificate (Short-Lived)` |
| Authentication mode | `Principal Propagation` |
| Allowed resources | `/sap/opu/odata/sap/Z_NB_ORDERS_SRV/*` (read-only paths only) |
| Check Internal Host | enabled |

### 4.2 — BTP destination

| Setting | Value |
|---|---|
| Name | `SAP_S4_NOVABEV` |
| Type | `HTTP` |
| URL | `https://s4-novabev:443/sap/opu/odata/sap/Z_NB_ORDERS_SRV` |
| ProxyType | `OnPremise` |
| Authentication | `PrincipalPropagation` |
| Additional property: `cloudConnectorLocationId` | (blank — single-CC trial) |
| Additional property: `WebIDEEnabled` | `true` |
| Additional property: `HTML5.DynamicDestination` | `true` |

### 4.3 — Trust setup (one-time)

- BTP subaccount Trust Configuration → IAS trust established
- On-prem ABAP system imports the Cloud Connector's principal-propagation CA so it trusts the short-lived certs
- IAS user attribute `userPrincipalName` mapped to ABAP user via SU01 / IDP attribute mapping

---

## 5. What was completed in this exercise

- Cloud Connector portable installed locally (macOS arm64), Apple Silicon arch checks and Gatekeeper xattr quarantine resolved on 131 SCC files
- Admin UI reachable on `https://localhost:8443`
- Subaccount registration form completed with the actual NB-Dev values
- Cloud-To-On-Premise system mapping designed (§4.1)
- BTP OnPremise destination designed (§4.2)
- Principal-propagation chain documented end-to-end (§2, §3, §4.3)

Same source design activates on a Pay-As-You-Go account where the runtime tunnel is fully provisioned.

---

## 6. Resume language

Designed hybrid connectivity from BTP to an on-prem S/4HANA system using SAP Cloud Connector. The connector establishes an outbound, encrypted reverse tunnel from inside the corporate network to BTP — no inbound firewall ports. Whitelisted virtual hosts in the Cloud-To-On-Premise mapping limit what's reachable. The Fiori app calls a destination of ProxyType OnPremise with Authentication PrincipalPropagation; the BTP user's identity flows through XSUAA, into the connectivity proxy, through the tunnel, and the connector exchanges the user assertion for a short-lived X.509 cert that the on-prem system trusts. Result: no ingress, least-privilege resource exposure, and the on-prem system audits the real user instead of a shared service account.
