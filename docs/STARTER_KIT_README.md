# Dental Network: Legacy BI Migration & Financial Reconciliation (POC)

**Synthetic educational dataset. NOT Pacific Smiles Group data, an internal schema, or a representation of their actual reporting systems.**

## Business scenario
A fictional Australian dental-centre operator maintains legacy SQL Server tables for centres, practitioners, appointments, invoices, payments and monthly targets. A migration team must reproduce its monthly reporting in a modern lakehouse and reconcile output before decommissioning legacy reports. This scenario is inspired by publicly described dental-service-organisation business models, not by any proprietary architecture.

## Contents
- `data/`: 8 CSV files (SQL Server-style legacy exports).
- `sql/01_create_legacy_tables.sql`: SQL Server table definitions.
- `sql/02_legacy_reporting_and_checks.sql`: baseline reporting and reconciliation logic.
- `docs/DATA_DICTIONARY.md`: data meaning and business rules.
- `docs/FABRIC_WORKPLAN.md`: step-by-step first Fabric project.

## Row counts
- Centres: 12; practitioners: 84; service catalog: 8
- Appointments: 7200; invoices: 6198; payments: 5824
- Monthly targets: 144; legacy monthly financial report: 144

## Core reporting rules
1. `Completed` appointments only are counted in completed-appointment KPIs.
2. Gross patient fee and facility service fee are **different measures**; do not label either as the other's revenue.
3. Monthly financial report is grouped by appointment month and centre, not payment month.
4. Cancelled and no-show appointments have no invoice in this simulation.
5. Unpaid invoices may exist; payments are separate from invoiced amounts.
6. The synthetic report CSV is a legacy baseline for independent reconciliation.

## How to use
Import CSV files into SQL Server or Fabric Lakehouse, preserving IDs and decimal types. SQL DDL is a schema reference; loading the CSV files into SQL Server requires an import tool or BULK INSERT with appropriate paths. Use the reconciliation SQL against SQL Server after import.

## Disclosure
Use in portfolio as an independent proof of concept using synthetic data. Do not claim production Fabric experience until you have executed and validated a Fabric pipeline.
