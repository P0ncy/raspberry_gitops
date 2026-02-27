# 🍓 Raspberry Pi GitOps

Infrastructure as Code pour Raspberry Pi, géré via **Flux CD**.

## Structure

```
.
├── clusters/
│   └── raspberry-pi/
│       └── infrastructure.yaml     # Point d'entrée Flux pour le cluster
└── infrastructure/
    ├── base/
    │   └── raspberry-pi/           # Manifestes de base (réutilisables)
    │       ├── kustomizeconfig.yaml
    │       ├── namespace.yaml
    │       └── prometheus.yaml
    └── raspberry-pi/               # Overlay spécifique au Pi
        ├── kustomization.yaml
        └── prometheus-values.yaml  # Valeurs custom (ressources limitées)
```

## Pattern

- `clusters/<cluster>/` → Flux lit ce dossier au bootstrap
- `infrastructure/base/` → Manifestes génériques réutilisables
- `infrastructure/<cluster>/` → Surcharges spécifiques à l'environnement

## Bootstrap

```bash
flux bootstrap github \
  --owner=P0ncy \
  --repository=raspberry_gitops \
  --branch=main \
  --path=clusters/raspberry-pi \
  --personal
```
