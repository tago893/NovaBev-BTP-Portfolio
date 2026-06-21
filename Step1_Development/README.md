# Step 1 — Development (CAP + Fiori Elements + freestyle UI5)

A NovaBev order-capture service. Three entities (Products, Orders, OrderItems with composition) modeled in CDS, exposed as an OData V4 service via CAP, with custom Node.js handlers for validation and totals. Two UIs on top — a Fiori Elements List Report + Object Page driven by UI annotations, and a freestyle UI5 view bound to the same model. Deployed as MTA to Cloud Foundry, secured with XSUAA, hosted via the HTML5 App Repository, fronted by Launchpad.

## Files

| File | What it shows |
|---|---|
| `01_bas_browser.png` | BAS open with the project + service + UI tabs |
| `01_browser_state.png` | The dev workflow across multiple tabs |
| `01_fiori_storyboard.png` | Fiori Storyboard showing List Report + Object Page |
| `01b_cap_files.png` | CAP project tree — `mta.yaml`, `services.cds`, handlers, annotations |
| `01b_calculated_order.png` | Order with auto-calculated total + derived "Needs Approval" status (handler firing) |
| `01c_ui5_view.png` | Freestyle UI5 XML view with table binding |
| `01c_manifest.png` | `manifest.json` showing the OData V4 model definition |
| `01c_ui5_running.png` | Freestyle UI5 app running, NovaBev orders rendered live from OData |
| `01c_fiori_running.png` | Fiori Elements app running |
| `01_deployed_instances.png` | Subaccount Instances — destination + html5 + xsuaa bound to the deployed CAP app |
| `01_storyboard.png` | BAS Storyboard view: data model + service + UI apps |
| `01_project_anatomy.png` | PlantUML diagram of the CAP+UI5 project anatomy |
| `01d_request_journey.png` | PlantUML sequence: user click → CAP → DB → response |

## Resume language

Built and deployed full-stack SAP BTP applications using the CAP model — authored CDS data models, exposed OData V4 services, generated SAP Fiori Elements (List Report / Object Page) UIs, hand-built freestyle SAP UI5 (MVC, manifest, OData V4 binding), and deployed as MTA to Cloud Foundry behind the Launchpad service. Extended CAP services with custom Node.js handlers (before/after CRUD events) for validation and derived fields.
