NovaBev — June 2026 Consumption Review
──────────────────────────────────────
Period: Jan 1 – Jun 20, 2026
Scope:  NovaBev directory (NB-Dev, NB-Test, NB-Prod)

Top consumers (NB-Dev)
  • SAP Business Application Studio (Trial plan) — active developer
    workload, spike CW25.
  • Cloud Foundry Runtime — ~50–100 MB held by the `novabev` space
    serving the deployed CAP order app (Fiori Elements + freestyle UI5
    + XSUAA + Destination + HTML5 App Repo bindings).

Shelfware
  • Cloud Foundry Runtime — Standard plan: 0.0 Byte usage. The
    deployed app runs on the bundled trial CF plan, so the Standard
    entitlement is unused. Action: leave entitled at 1 shared unit
    (no cost on trial); on a Pay-As-You-Go account this would be
    de-entitled to free shared units.
  • NB-Test, NB-Prod: zero workload — expected, these are placeholders
    for the documented 3-environment design.

Quota caps set
  • All plans capped at trial defaults (1 shared unit).
  • Cloud Foundry runtime: trial-bundled; granular MEMORY quota
    distribution requires Pay-As-You-Go and is documented as a
    migration item.

Alerting
  • Pattern: SAP Alert Notification service with a usage-threshold
    rule at 80% on Cloud Foundry MEMORY per subaccount.
  • Status on trial: pattern documented; service not yet provisioned
    (entitlement gap).

Actions taken
  • Capped quotas at directory level via Entitlement Management.
  • Removed shelfware: none on trial (no instance is safely deletable
    without breaking the deployed CAP app).
  • Custom-scoped admin role collection (NB_Dev_Admin) created and
    verified absent in NB-Test (scoped-access proof).

Owner: varunch@pdx.edu
Next review: monthly
