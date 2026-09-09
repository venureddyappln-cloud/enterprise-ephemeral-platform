# enterprise-ephemeral-platform
# Enterprise Ephemeral Platform (EEP) Framework

[![Platform Test Framework](https://github.com)](https://github.com)

An industry-grade Internal Developer Platform (IDP) utilizing a hybrid Infrastructure-as-Code (IaC) monorepo architecture. This project isolates foundational, persistent cloud footprints from rapid, software-driven application runtime sandbox environments.

## 🏗️ Architecture Blueprint

```text
                          ┌──────────────────────────┐
                          │   GitHub Actions CI/CD   │
                          └─────────────┬────────────┘
                                        │
                 ┌──────────────────────┴──────────────────────┐
                 ▼                                             ▼
  ┌─────────────────────────────┐               ┌─────────────────────────────┐
  │      Terraform Layer        │               │        Pulumi Layer         │
  │   (Core Shared Infra)       │               │   (Dynamic App Envs)        │
  ├─────────────────────────────┤               ├─────────────────────────────┤
  │ • Hub-and-Spoke Networking  │               │ • Ephemeral App Services    │
  │ • Dedicated AKS Clusters    │               │ • Managed Resource Identity │
  │ • Custom Private Endpoints  │               │ • Dynamic Configurations    │
  └─────────────────────────────┘               └─────────────────────────────┘
```

## 🛠️ Project Structure & Design Patterns

The codebase is split into three decoupled enterprise tiers:

*   **`./terraform` (Core Infrastructure)**: Uses declarative HCL modules to provision a hardened Azure infrastructure baseline, featuring secure virtual networking subnets and a managed Azure Kubernetes Service (AKS) system node control plane.
*   **`./pulumi` (Application Automation)**: Built with TypeScript and Node.js to act as an abstraction wrapper engine. It automatically provisions on-demand developer web app sandboxes hooked directly into the AKS cluster bounds.
*   **`.github/workflows` (Automated Governance)**: Houses continuous integration automation test code that triggers on every push to execute structural linting, cross-module configuration checks, and backend dependency compilations.

## 🚀 Key Platform Features

*   **Hybrid State Modeling**: Blends the rigid stability of Terraform modules with the dynamic flexibility of Pulumi SDK constructs.
*   **Automated Continuous Integration**: Integrated linting, validation (`terraform validate`), and dependency building to prevent broken manifests from hitting cloud subscriptions.
*   **FinOps Mindset**: Ready-made configurations structured to cleanly accept parameterized operational teardown commands (`destroy`) to wipe out idle sandboxes.

---
*Maintained by [VenuGopal Reddy](https://github.com)*
⚙️ Platform Infrastructure & App Test Framework  #1
📌 Main branch updated by venureddyappln-cloud (Commit: a23a456)
⏱️ Total runtime duration: 42s
✅ Status: SUCCESSFUL
  ▶ 🟩 Download Project Repository Files ............................... (Success - 03s)
  ▶ 🟩 Setup Terraform Verification Engine ............................. (Success - 08s)
  ▶ 🟩 Execute Core Architecture Validation Checks ..................... (Success - 11s)
       └─ Log: Success! The configuration is valid.
  ▶ 🟩 Setup Node.js Environment for Pulumi App Layer .................. (Success - 05s)
  ▶ 🟩 Verify Pulumi Application Sandbox Dependencies Compilation ...... (Success - 15s)
       └─ Log: added 221 packages, and audited 222 packages. 0 vulnerabilities.
                            
