#!/bin/bash
# Sync manuelle de toutes les kustomizations
set -e

echo "🔄 Sync Flux en cours..."
flux reconcile source git raspberry-gitops
flux reconcile kustomization apps
flux reconcile kustomization infrastructure
echo "✅ Sync terminée !"
