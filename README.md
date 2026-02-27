# 🍓 Raspberry Pi GitOps

Infrastructure as Code pour Raspberry Pi, géré via **Flux CD**.

## Architecture

```
raspberry_gitops/
├── apps/               # Applications déployées (Docker Compose)
├── flux/               # Configuration Flux CD
│   ├── sources/        # Sources Git/Helm
│   ├── kustomizations/ # Kustomizations Flux
│   └── helmreleases/   # Helm Releases
├── infrastructure/     # Configuration système
│   ├── system/         # Packages, configs OS
│   └── docker/         # Config Docker globale
└── scripts/            # Scripts utilitaires
    ├── bootstrap.sh    # Init Flux sur le Pi
    ├── sync.sh         # Sync manuelle
    └── rollback.sh     # Rollback dernière version
```

## Démarrage rapide

```bash
# 1. Bootstrap Flux sur le Pi
bash scripts/bootstrap.sh

# 2. Sync manuelle
bash scripts/sync.sh
```

Flux surveille ce repo toutes les **60 secondes** et applique les changements automatiquement.
