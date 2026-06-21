# NovaBev BTP → BDC Portfolio

Varun Chikkala — `varunch@pdx.edu`

A hands-on build of a single business problem — capture beverage orders, integrate to logistics, govern the landscape, secure, automate, extend, analyze — across all seven SAP BTP layers. NovaBev is a fictional beverage company running three company codes (NB01 Houston, NB02 Mumbai, NB03 London) that I used as the throughline so each step keeps building on the same scenario instead of being a disconnected demo.

Reference: SR SOFT *NovaBev BTP → BDC Build Bible v3*, Edition 2026.1.

## Status

| Step | Status | What's in the folder |
|---|---|---|
| 0 — Foundation | Done | BTP trial account + BAS dev space provisioned |
| 1 — Development | Done | CAP + OData V4 service, Fiori Elements + freestyle UI5, deployed to Cloud Foundry |
| 2 — Integration | Live + design | CPI iFlow live (200 OK end-to-end, SAP correlation IDs). API Management proxy and policy stack configured |
| 3 — Administration | Live + design | NB-Dev / NB-Test / NB-Prod under a NovaBev directory; scoped admin role; live destination; Cloud Connector installed and principal-propagation chain documented |
| 4 — Security | In progress | IAS trust active; xs-security.json + role collections + row-level demo: next session |
| 5 — Build | Built | BPA approval process — typed trigger, decision artifact, approval form with Approve/Reject, released v1.0.0 |
| 6 — RAP | Source-complete | Full RAP business object source (table, CDS interface + projection, behavior definition, service binding, handler class) |
| 7 — Analytics (BDC) | In progress | Datasphere tenant being set up; sample dataset prepared |
| Capstone | Pending | 8-slide deck + 5-min demo + live links — pulls together when remaining steps land |

## Folder layout

```
Step0_Foundation/      BTP account + BAS dev space
Step1_Development/     CAP + Fiori + UI5 + project anatomy diagrams
Step2_Integration/     CPI iFlow + API Mgmt configuration
Step3_Administration/  Multi-env landscape + scoped roles + Cloud Connector
Step4_Security/        IAS trust (more next session)
Step5_Build/           BPA approval process
Step6_RAP/             RAP source files
Step7_Analytics/       Datasphere + SAC (in progress)
Capstone/              Final deck + demo (pending)
```

Each step folder has a `README.md` with the file inventory and what each artifact shows. PlantUML diagrams render at https://www.plantuml.com/plantuml/uml or with the VS Code PlantUML extension.
