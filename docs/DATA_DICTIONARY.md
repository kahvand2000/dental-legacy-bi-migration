# Data dictionary

| CSV | Grain | Key | Notes |
|---|---|---|---|
| legacy_centres | One dental centre | centre_id | Fictional names and brand labels |
| legacy_practitioners | One practitioner | practitioner_id | Synthetic IDs, no personal data |
| legacy_service_catalog | One service | service_code | Synthetic prices in AUD |
| legacy_appointments | One appointment | appointment_id | Completed / Cancelled / No Show |
| legacy_invoices | One invoice | invoice_id | One invoice per completed appointment |
| legacy_payments | One payment | payment_id | Some invoices intentionally unpaid |
| legacy_monthly_targets | Centre-month | centre_id + reporting_month | Synthetic operational targets |
| legacy_monthly_financial_report | Centre-month | centre_id + reporting_month | Baseline to compare against migrated model |

Amounts are AUD. The facility fee is a simplified percentage of the patient fee; actual business contracts may differ. No patient identifiers or health records are present.
