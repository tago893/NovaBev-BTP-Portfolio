# Step 7 — Analytics (SAP Datasphere + SAC, the BDC stack)

NovaBev beverage sales modeled as a star schema in Datasphere — `Sales` fact, dimensions on company code, product, date — with an Analytic Model exposing measures (Total Sales) and dimensions to SAP Analytics Cloud. SAC connected live to the Datasphere model and a story with bar / line / numeric-point charts plus a `companyCode` filter.

## Files

| File | What it is |
|---|---|
| `novabev_sales.csv` | 23 rows of NovaBev beverage sales across NB01 / NB02 / NB03, Jan–Jun 2026, ready for Datasphere import |

## Coming next

- `07_datasphere_home.png` — Datasphere home after sign-in
- `07_datasphere_view.png` — Graphical View canvas (Sales table → Projection → Aggregation → output) with semantic settings
- `07_datasphere_preview.png` — Data preview showing aggregated rows by company code + date
- `07_sac_connection.png` — SAC connection to Datasphere
- `07_sac_model.png` — Live model imported from the Datasphere Analytic Model
- `07_sac_dashboard.png` — Story / dashboard with charts and a `companyCode` filter

## Resume language

Delivered cloud analytics on the SAP Business Data Cloud stack — modeled facts/dimensions and a semantic analytic model in SAP Datasphere (graphical views, aggregation, deployment), connected SAP Analytics Cloud live, and built interactive executive dashboards on SAP Datasphere data.
