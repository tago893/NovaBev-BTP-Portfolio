# Step 4 — Security (IAS, Trust, XSUAA, Role Collections)

The 3-question security model — who are you (IAS), do I trust that (Trust Configuration), what may you do (XSUAA scopes → role templates → role collections → users).

## Files

| File | What it shows |
|---|---|
| `04_trust.png` | Establish Trust dialog for NB-Dev — connecting an identity provider |

## Coming next session

- `04_xssecurity.png` — Roles page after deploying with the new `xs-security.json`
- `04_xssecurity_file.png` — `xs-security.json` open in BAS
- `04_rolecollection.png` — `NovaBev_Order_Approver` collection with role + `companyCode` attribute + assigned user
- `04_403_then_ok.png` — same app, no role → 403, role added → 200
- `04a_*` — IAS users + groups + MFA + branding
- `04b_rowlevel_demo.png` — same app, two `companyCode` attributes → two data slices
- `04c_oauth_token.png`, `04c_jwt_scopes.png`, `04c_401_then_200.png`, `04c_audit_log.png`

## Resume language (target)

Implemented enterprise SAP BTP security. Configured IAS with trust, defined application authorization scopes/role templates in `xs-security.json` with XSUAA, authored CAP `@restrict` clauses for instance/attribute-based row-level isolation, secured machine-to-machine APIs via OAuth2 client-credentials with JWT scope validation, and enabled audit logging.
