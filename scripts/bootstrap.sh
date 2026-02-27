#!/bin/bash
# Bootstrap Flux CD sur le Raspberry Pi
set -e

REPO_URL="https://github.com/P0ncy/raspberry_gitops"
BRANCH="main"

echo "🍓 Bootstrap GitOps Raspberry Pi..."

# Vérifier flux CLI
if ! command -v flux &>/dev/null; then
  echo "Installation de Flux CLI..."
  curl -s https://fluxcd.io/install.sh | sudo bash
fi

# Bootstrap Flux
flux bootstrap github \
  --owner=P0ncy \
  --repository=raspberry_gitops \
  --branch=$BRANCH \
  --path=flux \
  --personal

echo "✅ Flux CD bootstrappé avec succès !"
