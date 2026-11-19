# Microsoft Fabric Lakehouse — uploaded evidence

This folder contains **actual artifacts uploaded from the Fabric work**, not fabricated examples.

## Currently available

| File | Description |
| --- | --- |
| [`01_Legacy_Data_Ingestion.ipynb`](01_Legacy_Data_Ingestion.ipynb) | Exported PySpark notebook for ingestion into the Lakehouse |
| [`02_Financial_Reconciliation.ipynb`](02_Financial_Reconciliation.ipynb) | Exported financial reconciliation notebook |
| [`LakehouseTables.PNG`](LakehouseTables.PNG) | Fabric Lakehouse tables screenshot |
| [`DentalLegacyLakehouse.PNG`](DentalLegacyLakehouse.PNG) | Fabric Lakehouse environment screenshot |

A further copy of the Lakehouse screenshot is available at [`../DentalLegacyLakehouse.PNG`](../DentalLegacyLakehouse.PNG).

## Still to add

- `03_Payment_Reconciliation.ipynb` — the actual exported payment reconciliation notebook.
- If available, screenshots clearly showing the final executed financial and payment reconciliation outputs, with result counts and run status.

The project case study reports **144 financial centre-month groups passed, 0 failed** and 5,824 fully paid versus 374 unpaid invoices. Uploaded code and interface screenshots support review of the implementation, but the independently reviewable evidence is limited to the artifacts above.

Before publishing further screenshots or notebooks, remove access tokens, tenant secrets, personal identifiers and private connection strings.
