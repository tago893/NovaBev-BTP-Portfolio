# Step 6 — RAP (RESTful ABAP Programming Model)

A complete managed RAP business object for NovaBev's `Promotion` entity:

- Persistent table `znb_promo`
- CDS interface view `ZI_NB_Promotion` with administrative annotations
- CDS projection view `ZC_NB_Promotion` with full UI annotations (`@UI.lineItem`, `@UI.identification`, `@UI.selectionField`, `@UI.headerInfo`, search, facet)
- Behavior definition: `managed; with draft`, lock master, ETag, three validations (discount %, date range, company-code list), one determination (default `IsActive`)
- Behavior implementation class skeleton with all four handlers
- Service definition + OData V4 UI binding configuration

This is the clean-core way of building S/4HANA extensions: define data, declare behavior, expose as OData, render in Fiori — the platform generates the runtime, the CRUD, the draft handling, and the UI.

## Files

| File | What it is |
|---|---|
| `01_table_znb_promo.tabl.abap` | DDIC table |
| `02_zi_nb_promotion.ddls.abap` | CDS interface view (data layer) |
| `03_zc_nb_promotion.ddls.abap` | CDS projection view (UI/consumption layer) with `@UI` annotations |
| `04_zi_nb_promotion.bdef.abap` | Behavior definition: managed, with draft, validations, determination |
| `05_zc_nb_promotion.bdef.abap` | Projection behavior |
| `06_zui_nb_promotion.srvd.abap` | Service definition + binding configuration |
| `07_zbp_i_nb_promotion.clas.abap` | Behavior implementation class with the four handlers |

## Architecture (clean-core stack)

```
                  ┌──────────────────────────────┐
                  │   Fiori Elements UI          │
                  │   (auto-generated from CDS   │
                  │    + UI annotations)         │
                  └───────────────┬──────────────┘
                                  │ OData V4
                  ┌───────────────▼──────────────┐
                  │  Service Binding             │
                  │  ZUI_NB_PROMOTION_O4         │
                  └───────────────┬──────────────┘
                                  │
                  ┌───────────────▼──────────────┐
                  │  Service Definition          │
                  │  ZUI_NB_PROMOTION            │
                  └───────────────┬──────────────┘
                  ┌───────────────▼──────────────┐
                  │  Projection View             │
                  │  ZC_NB_Promotion             │
                  │  (@UI annotations live here) │
                  └───────────────┬──────────────┘
                  ┌───────────────▼──────────────┐
                  │  Projection Behavior         │
                  │  use create; use update; …   │
                  └───────────────┬──────────────┘
                  ┌───────────────▼──────────────┐
                  │  Interface Behavior          │
                  │  managed; with draft         │
                  │  validations + determination │
                  └───────────────┬──────────────┘
                  ┌───────────────▼──────────────┐
                  │  Handler class               │
                  │  3 validate methods +        │
                  │  1 determine method          │
                  └───────────────┬──────────────┘
                  ┌───────────────▼──────────────┐
                  │  Interface View              │
                  │  ZI_NB_Promotion             │
                  └───────────────┬──────────────┘
                  ┌───────────────▼──────────────┐
                  │  Database table  znb_promo   │
                  └──────────────────────────────┘
```

## Reading order

1. `01_table_znb_promo.tabl.abap` — what the data looks like on disk
2. `02_zi_nb_promotion.ddls.abap` — the data layer
3. `03_zc_nb_promotion.ddls.abap` — UI annotations (where annotations drive Fiori without front-end code)
4. `04_zi_nb_promotion.bdef.abap` — behavior, including draft, validations, determination
5. `07_zbp_i_nb_promotion.clas.abap` — handler skeleton showing how validations are wired

## Resume language

Developed clean-core S/4HANA-style extensions using the RESTful ABAP Programming Model (RAP) — authored CDS interface/projection views with UI annotations, managed behavior definitions with draft handling, validations and determinations, and OData V4 UI service bindings consumed by SAP Fiori Elements on the SAP BTP ABAP Environment.
