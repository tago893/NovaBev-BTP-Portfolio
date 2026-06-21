# Step 3 — Administration

A real three-environment landscape (NovaBev directory containing NB-Dev, NB-Test, NB-Prod) with directory-level entitlement governance. A custom-scoped admin role collection (`NB_Dev_Admin`) that exists in NB-Dev and is verified absent in NB-Test. Per-subaccount entitlement assignments. A consumption review identifying top consumers and shelfware. A live destination with a green Check Connection. Cloud Connector installed locally on macOS arm64, and the principal-propagation chain documented end-to-end.

## Files

### Landscape (Exercise 3A)

| File | What it shows |
|---|---|
| `03a_landscape.png` | Account Explorer: NovaBev directory + 4 subaccounts (NB-Dev, NB-Test, NB-Prod, plus the Azure Integration Suite tenant kept outside the directory by region constraint) |
| `03a_directory_created.png` | NovaBev directory after creation, Entitlement Management enabled |
| `03a_role_collection.png` | NB-Dev Role Collections list with `NB_Dev_Admin` |
| `03a_scoped_access.png` | NB-Test Role Collections — `NB_Dev_Admin` is absent (the scoping proof) |
| `03a_cf_space_member.png` | Cloud Foundry Space Members |
| `03a_landscape_design.md` | Landscape design + entitlement inheritance |

### Quotas + consumption review (Exercise 3B)

| File | What it shows |
|---|---|
| `03b_quotas.png` | NB-Dev Entity Assignments page — per-plan quotas |
| `03b_quotas_nbprod.png` | NB-Prod Entity Assignments — same governance applied per env |
| `03b_usage_analytics.png` | Usage Analytics: top consumer, shelfware (CF Standard plan zero usage) |
| `03b_consumption_review.md` | One-page consumption review |

### Destination (Step 3.3)

| File | What it shows |
|---|---|
| `03_destination_ok.png` | `NovaBev_Logistics` destination with green Check Connection |

### Cloud Connector + principal propagation (Exercise 3C)

| File | What it shows |
|---|---|
| `03c_subaccount_details.png` | NB-Dev Overview with the IDs and CF API endpoint used for Cloud Connector |
| `03c_btp_cloud_connectors_page.png` | BTP Cloud Connectors page |
| `03c_subaccount_attempt.png` | Cloud Connector Define Subaccount form, NB-Dev values entered |
| `03c_subaccount_attempt_us10.png` | Same form with the parent-region attempt |
| `03c_install_log.txt` | Local install notes (arch resolution, Gatekeeper xattr fix) |
| `03c_pp_notes.md` | Principal-propagation chain: 7-hop diagram, system mapping, OnPremise destination, IAS trust, interview-ready summary |

### Bonus

| File | What it shows |
|---|---|
| `03_subaccount_overview.png` | NB-Dev Overview — entitlements, CF env |

## Resume language

Administered SAP BTP at scale. Designed multi-environment (Dev/Test/Prod) landscapes with directory-level entitlement governance and custom scoped admin role collections. Performed quota capping, usage-analytics consumption reviews, and shelfware reclamation. Established secure hybrid connectivity via Cloud Connector with OnPremise destinations and principal propagation (live install on macOS arm64; production design documented).
