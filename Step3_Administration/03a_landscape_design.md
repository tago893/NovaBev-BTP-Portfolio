NovaBev Landscape Design
─────────────────────────
Global Account: 540e3537trial
Directory:      NovaBev (entitlement management enabled)
                ID 2e7bd423-d20b-4af2-aa65-15bd36229e68

Children (inside directory):
  ├── NB-Dev    (subdomain: novabev-…  · region: AWS · CF enabled)  ← ACTIVE
  ├── NB-Test   (region: AWS · CF enabled)                         ← placeholder
  └── NB-Prod   (region: AWS · CF enabled)                         ← placeholder

Sibling (outside directory, by design):
  └── novabevOrdertoLogst…  (region: Azure · Integration Suite tenant)
      Reason: SAP Integration Suite trial is region-restricted to
      Azure (Singapore) or AWS (US East); kept outside the BU
      directory to honor that regional constraint.

Entitlements applied at DIRECTORY level (inherited by children):
  • Authorization & Trust Management Service (XSUAA) — application, broker
  • Destination Service — lite
  • HTML5 Application Repository Service — app-host, app-runtime
  • Cloud Foundry Environment — trial
  • SAP Business Application Studio
  • Connectivity Service — lite
  • Audit Log Management Service — default
  • Cloud Identity Services
  • Application Logging / Autoscaler / Content Agent / Credential Store
  • Master Data Integration / SaaS Provisioning / Service Manager
  • Feature Flags Service

Inheritance model: subaccounts draw entitlements from directory
quotas. Trial allocations bundled per plan ("1 shared unit");
granular per-environment quota distribution requires Pay-As-You-Go.

Custom role collection (NB-Dev only):
  Name:         NB_Dev_Admin
  Description:  Subaccount admin scoped to NovaBev Dev
  Roles:        Subaccount Administrator (cis-local)
  Users:        varunch@pdx.edu
  Verified:     absent from NB-Test → scoped-access proof captured
                in 03a_scoped_access.png

Currently deployed in NB-Dev (CAP application bindings):
  • novabev-orders-destination  (Destination Service · lite)
  • novabev-orders-html5        (HTML5 App Repository · app-host)
  • novabev-orders-xsuaa        (XSUAA · application)
