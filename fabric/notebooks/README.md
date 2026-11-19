# Microsoft Fabric notebooks — export required

The notebooks executed in the user's Microsoft Fabric workspace are **not included** in the available source archives. Do not treat the starter `docs/FABRIC_IMPLEMENTATION_PLAN.md` as executed code.

Export these **actual executed** notebooks from Fabric and add their `.ipynb` files here:

- `01_...` (raw CSV-to-Delta ingestion notebook, if used)
- `02_Financial_Reconciliation.ipynb`
- `03_Payment_Reconciliation.ipynb`

Include code cells with outputs only if they are suitable for public disclosure. Do not publish tokens, API credentials, tenant secrets, or private endpoints.

Until exported, this repository documents Fabric outcomes via the independently prepared case study and PDF dashboard, but does **not** provide independently executable evidence of the Fabric processing.
