# First-time Microsoft Fabric execution plan

1. Create a Fabric workspace and Lakehouse (subject to your tenant permissions and capacity/trial).
2. Upload the eight CSV files to Lakehouse Files.
3. Use Dataflow Gen2 or a notebook to load CSV into Delta tables, applying `DATE`, integer and `DECIMAL(12,2)` types.
4. Create curated reporting tables at centre-month grain; count only `Completed` appointments.
5. Reconcile the curated result to `legacy_monthly_financial_report` by centre/month: record counts, completed appointments and facility fee totals.
6. Add a separate payment reconciliation by invoice ID; distinguish billed from collected amounts.
7. Build a Power BI report with monthly facility fees, completed appointments, centre comparison and target variance.
8. Capture screenshots and record evidence of PASS/FAIL validation; document any intentional differences.

**Important:** These are steps to perform, not steps already completed. The supplied CSV and SQL do not themselves constitute an executed Fabric migration.
