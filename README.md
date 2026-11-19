# Dental Legacy BI Migration | SQL Server → Microsoft Fabric → Power BI

**Independent portfolio proof of concept using fully synthetic dental data.** This repository is **not affiliated with or endorsed by Pacific Smiles Group**, contains no real patient or company data, and does not represent that organisation’s internal systems. The dashboard's blue-and-green visual identity was inspired by publicly visible brand styling, not an official design system.

![Executive overview report](screenshots/01_executive_overview.png)

## Overview

This project simulates modernising legacy monthly reporting for a fictional 12-centre dental network. It begins with a purpose-built synthetic dataset and SQL Server reporting baseline, stages raw data in a Fabric Lakehouse, produces curated Delta reporting tables and reconciliation checks, and presents results in a three-page Power BI report.

**Quick review:** [Case Study (PDF)](docs/Case_Study.pdf) · [3-page Dashboard Preview (PDF)](docs/Dashboard_Preview.pdf)

## Architecture

```text
Synthetic dental CSV data (8 source files)
         ↓
SQL Server legacy schema + baseline financial reporting
         ↓
Microsoft Fabric Lakehouse: Files/raw CSV → Delta tables
         ↓
PySpark notebooks: financial and payment reconciliation
         ↓
Curated reporting + validation tables
         ↓
Power BI semantic model → 3-page interactive report
```

## Dataset and observed results

| Item | Count / result |
| --- | ---: |
| Dental centres | 12 |
| Practitioners | 84 |
| Service catalogue entries | 8 |
| Appointment records | 7,200 |
| Completed appointments / invoices | 6,198 |
| Payment records / fully paid invoices | 5,824 |
| Unpaid invoices | 374 |
| Monthly target rows | 144 |
| Monthly legacy report rows | 144 |
| Financial centre-month reconciliation groups | **144 passed / 0 failed** |
| Gross invoiced | **A$2,873,354** |
| Collected payments | **A$2,689,156** |
| Outstanding balance | **A$184,198** |
| Facility service fees | **A$1,008,051.76** |

Figures are outcomes reported from the completed proof of concept and PDF dashboard, not evidence of production performance. Gross patient fees and facility service fees are different measures.

## Explore the repository

| Folder | Contents |
| --- | --- |
| [`data/`](data/) | Eight synthetic CSV source tables |
| [`sql/`](sql/) | SQL Server DDL and baseline financial reconciliation/data-quality queries |
| [`docs/DATA_DICTIONARY.md`](docs/DATA_DICTIONARY.md) | Source definitions and reporting business rules |
| [`docs/Case_Study.pdf`](docs/Case_Study.pdf) | Two-page professional technical summary |
| [`docs/Dashboard_Preview.pdf`](docs/Dashboard_Preview.pdf) | Final Power BI dashboard preview |
| [`screenshots/`](screenshots/) | Rendered images of all three Power BI pages |
| [`fabric/notebooks/`](fabric/notebooks/) | **Pending:** exports of real executed Fabric notebooks |
| [`fabric/evidence/`](fabric/evidence/) | **Pending:** real Lakehouse and notebook execution screenshots |
| [`powerbi/`](powerbi/) | Notes about the live Power BI project and secure sharing |

## Dashboard pages

1. **Executive Overview** — 12 centres; 6,198 completed appointments; 86.1% completion; A$1.008M facility service fees; +46.0% versus target.
2. **Financial & Payment Analysis** — A$2.87M invoiced; A$2.69M received; A$184.20K outstanding; 93.6% collection rate; paid/unpaid invoice distribution.
3. **Migration & Data Quality** — 144 validation groups, 144 PASS, 0 FAIL; Legacy-vs-Fabric facility fees by centre and monthly reconciliation detail.

## Reproducing the source-side baseline

1. Create a SQL Server database and the `legacy` schema as needed.
2. Execute [`sql/01_create_legacy_tables.sql`](sql/01_create_legacy_tables.sql).
3. Import each matching CSV in [`data/`](data/) into the legacy tables using SSMS or a controlled import procedure, preserving IDs, dates and decimals.
4. Execute [`sql/02_legacy_reporting_and_checks.sql`](sql/02_legacy_reporting_and_checks.sql) to compare recomputed figures with the legacy monthly financial baseline and run integrity checks.
5. For the Fabric portion, follow the documented [implementation plan](docs/FABRIC_IMPLEMENTATION_PLAN.md) alongside the **actual exported execution notebooks** once they have been added. The plan alone does not prove execution.

## AI-assisted development

Claude Code was used to help refine the Power BI dashboard's visual design, layout and navigation. The author reviewed the model, DAX measures and reconciliation results. The project should be assessed on the reproducible data pipeline, explicit validation logic and demonstrated report outputs rather than on appearance alone.

## What is and isn't independently verifiable here

The CSVs and SQL scripts are included and reviewable; the final Power BI output is supplied as screenshots and PDF. The current bundle does **not yet contain exported Fabric notebook source or runtime screenshots**. The documented Fabric execution results must be supplemented with those actual exports rather than fabricated proof. The native Power BI project is also withheld from the public bundle pending connection-metadata review.

## License and usage

Educational portfolio material and synthetic data. Do not attribute the underlying dataset, schema, visuals or reported outcomes to Pacific Smiles Group or real dental operations.
