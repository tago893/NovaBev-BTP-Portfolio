# Portfolio Index

A quick map of where things live and what each piece shows. The detailed status table is in the top-level `README.md`.

## Quick file pointers

| File | What it shows |
|---|---|
| `Step0_Foundation/00_btp_account_explorer.png` | The BTP account hierarchy I provisioned |
| `Step1_Development/01_fiori_storyboard.png` | Fiori Elements + freestyle UI5 deployed to CF |
| `Step1_Development/01b_calculated_order.png` | A CAP handler firing on a live order — auto-totals, derived status |
| `Step1_Development/01_project_anatomy.png` | Project anatomy as a PlantUML diagram |
| `Step1_Development/01d_request_journey.png` | End-to-end click → CAP → DB → response sequence |
| `Step2_Integration/02_iflow_started.png` | Live CPI iFlow forwarding NovaBev orders |
| `Step3_Administration/03a_landscape.png` | NB-Dev / NB-Test / NB-Prod inside a NovaBev directory |
| `Step3_Administration/03a_scoped_access.png` | `NB_Dev_Admin` role collection scoped to Dev |
| `Step3_Administration/03_destination_ok.png` | BTP destination with green Check Connection |
| `Step3_Administration/03c_pp_notes.md` | Cloud Connector + principal-propagation design |
| `Step5_Build/05a_form_builder.png` | BPA approval form with Approve/Reject |
| `Step5_Build/05a_process_canvas.png` | Released BPA process v1.0.0 |
| `Step6_RAP/03_zc_nb_promotion.ddls.abap` | RAP CDS projection with full UI annotations |
| `Capstone/architecture.png` | Full NovaBev architecture in one PlantUML diagram |

## What I built per step

**Step 0 — Foundation.** BTP trial account, subaccount, Cloud Foundry, BAS dev space. The base everything else stands on.

**Step 1 — Development.** A NovaBev order service. CDS data model with Products, Orders, OrderItems (composition), exposed as OData V4 by CAP, custom Node.js handlers for validation and totals. Two UIs on top — Fiori Elements (annotation-driven) and freestyle UI5 (XML view + controller + manifest). Deployed as MTA to CF, secured with XSUAA, hosted via the HTML5 App Repo, fronted by Launchpad.

**Step 2 — Integration.** A CPI iFlow that takes a NovaBev order and forwards it to a logistics partner endpoint (webhook.site as the mock receiver). OAuth client-credentials + JWT for auth, with proper CSRF token handling. End-to-end POST returned 200 with SAP correlation IDs. On top of that, an API Management proxy with Spike Arrest + Verify API Key policies, an API Product, and a consumer Application — full design and policy stack in place.

**Step 3 — Administration.** Three-environment landscape inside a NovaBev directory (NB-Dev, NB-Test, NB-Prod), entitlement governance at directory level, custom-scoped admin role collection (`NB_Dev_Admin`) verified absent in NB-Test. A consumption review identifies top consumers and shelfware. Live destination with green Check Connection. Cloud Connector installed locally on macOS arm64 — fought through the Apple Silicon arch check and the Gatekeeper xattr quarantine on 131 SCC files to get the admin UI running. Principal-propagation chain documented end-to-end.

**Step 4 — Security.** Trust configuration in place. xs-security.json + role collections + row-level `@restrict` demo coming next session.

**Step 5 — Build.** Subscribed BPA via Service Marketplace, built an order-approval Process — API trigger with four typed inputs, a Decision artifact with FIRST MATCH on `amount >= 500`, and an approval Form with four read-only fields plus Approve/Reject. Wired the Inputs mapping from the trigger. Released the project as v1.0.0.

**Step 6 — RAP.** Full source for a managed RAP business object — `Promotion`. Persistent table, CDS interface and projection views (with `@UI.lineItem`, `@UI.identification`, `@UI.selectionField`, `@UI.headerInfo`), behavior definition with draft + lock master + ETag + three validations + one determination, projection BDL, service definition, behavior implementation skeleton class. Activates cleanly on any entitled ABAP Environment.

**Step 7 — Analytics.** Datasphere tenant being set up. Will model NovaBev sales as a star schema (Sales fact + company-code/product/date dimensions) and wire SAC live to it. Sample dataset (23 rows, all three company codes, six months) is in `Step7_Analytics/novabev_sales.csv`.

## Contact

`varunch@pdx.edu`
