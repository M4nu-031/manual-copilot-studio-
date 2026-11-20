#!/usr/bin/env bash
# Publica este manual como repositorio en GitHub usando GitHub CLI (gh).
# Uso:  ./publicar.sh [nombre-del-repo] [public|private]
set -euo pipefail

REPO="${1:-manual-copilot-studio-apl6006}"
VISIBILIDAD="${2:-public}"
DESCRIPCION="Manual for dummies en español para el Applied Skills APL-6006: Build an agent in Microsoft Copilot Studio"

command -v gh >/dev/null || { echo "Instala GitHub CLI: https://cli.github.com"; exit 1; }
gh auth status >/dev/null 2>&1 || gh auth login

cd "$(dirname "$0")"
if [ ! -d .git ]; then
  git init -b main
fi
git add .
git commit -m "Manual for dummies: Applied Skills APL-6006 (Copilot Studio)" || echo "Nada nuevo que confirmar"

gh repo create "$REPO" --"$VISIBILIDAD" --description "$DESCRIPCION" --source . --remote origin --push

gh repo edit --add-topic copilot-studio --add-topic microsoft-applied-skills \
  --add-topic ai-agents --add-topic espanol --add-topic apl-6006 || true

echo "Listo: $(gh repo view --json url -q .url)"
