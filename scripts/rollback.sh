#!/bin/bash
# Rollback au commit précédent
set -e

APP=${1:-"apps"}
echo "⏪ Rollback de $APP..."

PREV=$(git log --oneline -2 | tail -1 | awk '{print $1}')
git revert HEAD --no-edit
git push

echo "✅ Rollback effectué vers $PREV"
