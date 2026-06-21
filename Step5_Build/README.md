# Step 5 — SAP Build (BPA, Apps, Code, Work Zone)

A NovaBev order-approval Process built end-to-end in SAP Build Process Automation. API trigger with four typed inputs, a Decision artifact (FIRST MATCH on `amount >= 500`), and an approval Form with read-only fields plus Approve/Reject. Inputs mapped from the trigger, project released as v1.0.0.

## Files (5.4 — Process Automation)

### Setup

| File | What it shows |
|---|---|
| `05_buildcode_booster.png` | SAP Build Code booster wizard (alternative path explored) |
| `05a_create_project.png` | "What would you like to build?" — Application / Automated Process / Business Site |
| `05a_project_overview_empty.png` | NovaBev Order Approval project, initial state |

### Process build

| File | What it shows |
|---|---|
| `05a_trigger_added.png` | Process Builder with the Trigger + "Choose what happens next" palette |
| `05a_rule_conditions.png` | Decision Rule wizard — Configure Conditions step |
| `05a_decision_structure.png` | `Approval_Threshold` decision artifact: Input → Decision → Result |
| `05a_decision_in_process.png` | Decision step wired into the process |
| `05a_decision_table_errors.png` | Decision Table v1 with FIRST MATCH hit policy |
| `05a_decision_console_errors.png` | Design Console — validation pass |

### Approval form

| File | What it shows |
|---|---|
| `05a_form_edit_start.png` | `emailapproval` form — empty canvas, palette ready |
| `05a_form_builder.png` | Final form: heading + Customer + Company Code + Amount + Order ID + Approve/Reject |

### Wiring + release

| File | What it shows |
|---|---|
| `05a_inputs_mapping_attempt.png` | First mapping attempt — Inputs tab bound trigger fields to form |
| `05a_amount_expression_error.png` | Expression-syntax note for type coercion |
| `05a_decision_step_retry.png` | Decision step input parameter retry |
| `05a_inputs_mapping.png` | Final corrected mapping (Customer↔Amount swap fixed) |
| `05a_process_canvas.png` | Released v1.0.0 canvas: Trigger → Decision → Approval (`emailapproval2`) |
| `05a_project_overview_complete.png` | Project Overview showing released version + all artifacts |

## Resume language

Delivered SAP Build Process Automation end to end. Created a typed business process with API trigger, designed a decision artifact (FIRST MATCH policy) for amount-threshold routing, built a multi-field approval form with bind-mapped trigger inputs and Approve/Reject decisions, released a versioned project and deployed for runtime.
