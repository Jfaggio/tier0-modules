# tier0-modules - DEMO catalogue

A **functional stand-in** for the Saint-Gobain Tier-0 catalogue, for a personal tenant. Same layout
(`modules/<name>/<version>/`), same module names and versions, same inputs and outputs, so that a
subscription repository written for the real platform plans and applies here unchanged - but each
module is a minimal implementation with none of the platform integrations: no RPZ refresh, no
central Log Analytics diagnostics, no PCS function call, no private endpoints. Nothing in here is
Saint-Gobain code.

`.github/workflows/t0-terraform.yml` is the real reusable workflow (catalogue `v1.2.1`) with two
adaptations, both marked DEMO in the file: the runner comes from the caller's `T0_RUNS_ON`
variable, and the catalogue-reader GitHub App is optional - this repository is public, so
`terraform init` clones it anonymously when no App is configured.

Consume with `git::https://github.com/Jfaggio/tier0-modules.git//modules/<name>/<version>?ref=v1.2.1`.

| Module | Versions | Creates |
|---|---|---|
| resource-group | v1.0.0, v1.2.2 | `rg-<b>-<a>-<env>-<hub>-<instance>` |
| subnet | v5.2.0, v5.4.0 | a subnet in the core vnet with its NSG |
| keyvault | v3.0.0 | a key vault, public, with an access policy for the deploying principal |
| storage-account | v4.1.1, v5.0.0 | a storage account |
| storage-account-table | v2.1.1 | tables in it |
| service-plan | v1.2.1 | an App Service plan (B1) |
| app-insights | v1.3.0 | a workspace and an Application Insights on it |
| web-app | v3.1.0 | a Linux web app |
| postgresql | v3.1.0 | a Flexible Server B1ms - **costs about 15 EUR/month** |
| function-app | v3.0.0 | a Linux function app |
| virtual-network, automation-account, automation-runbook | as listed | the obvious |
