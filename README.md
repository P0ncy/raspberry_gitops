# 🍓 Raspberry Pi GitOps

Infrastructure as Code pour Raspberry Pi, géré via **Flux CD**.

## Stack

| Application | Namespace | Description |
|-------------|-----------|-------------|
| **Jellyfin** | `jellyfin` | Serveur multimédia |
| **Jellyseerr** | `jellyseerr` | Interface de demande de films/séries |
| **Radarr** | `arr` | Gestion et téléchargement de films |
| **Sonarr** | `arr` | Gestion et téléchargement de séries |
| **Prowlarr** | `arr` | Agrégateur d'indexeurs (YGG) |
| **Transmission** | `arr` | Client BitTorrent |
| **Tailscale** | `tailscale` | VPN mesh pour accès distant |

## Stockage

| Volume | Chemin | Taille | Contenu |
|--------|--------|--------|---------|
| `arr-media-pv` | `/media/poncy/SAMSUNG` | 400 Gi | Films et séries (disque externe) |
| `jellyfin-media-pv` | `/media/poncy/SAMSUNG` | 400 Gi | Partagé avec arr-media |
| `arr-downloads-pv` | `/var/lib/arr/downloads` | 100 Gi | Téléchargements en cours |

> 💾 Le stockage média pointe vers un disque externe Samsung (~466 Go).

## Structure

```
.
├── clusters/
│   └── raspberry/
│       └── infrastructure.yaml       # Point d'entrée Flux
└── application/
    ├── base/
    │   └── raspberry/
    │       ├── arr/                  # Radarr, Sonarr, Prowlarr, Transmission
    │       │   ├── helmrelease-*.yaml
    │       │   ├── pv.yaml
    │       │   └── pvc.yaml
    │       ├── jellyfin/             # Serveur multimédia
    │       │   ├── helmrelease.yaml
    │       │   ├── pv.yaml
    │       │   └── pvc.yaml
    │       ├── jellyseerr/           # Interface de demandes
    │       ├── tailscale/            # VPN accès distant
    │       └── sources/              # HelmRepositories
    └── raspberry/
        └── kustomization.yaml        # Overlay Pi
```

## Bootstrap

```bash
flux bootstrap github \
  --owner=P0ncy \
  --repository=raspberry_gitops \
  --branch=main \
  --path=clusters/raspberry \
  --personal
```

## Accès

| Service | URL locale |
|---------|-----------|
| Jellyfin | `http://<IP_PI>:30096` |
| Jellyseerr | `http://<IP_PI>:30097` |
| Radarr | `http://<IP_PI>:7878` |
| Sonarr | `http://<IP_PI>:8989` |
| Prowlarr | `http://<IP_PI>:9696` |
| Transmission | `http://<IP_PI>:9091` |

> 🌐 Accès distant via **Tailscale** — connecter le Pi et le Chromecast au même réseau Tailscale.

## Notes

- Radarr et Sonarr : limite mémoire à **1 Gi** (augmentée suite à OOMKill)
- Qualité cible : **1080p** (REMUX désactivés)
- Langue préférée : **Français (VF/VOSTFR/MULTi)**
