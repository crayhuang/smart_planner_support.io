#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${DEPLOY_CONFIG:-$ROOT_DIR/.env.deploy}"
DEPLOY=false

if [[ "${1:-}" == "--deploy" ]]; then
  DEPLOY=true
elif [[ -n "${1:-}" ]]; then
  echo "Usage: $0 [--deploy]" >&2
  exit 64
fi

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Missing deployment configuration: $CONFIG_FILE" >&2
  echo "Copy .env.deploy.example to .env.deploy and fill in the server values." >&2
  exit 1
fi

# shellcheck disable=SC1090
source "$CONFIG_FILE"

for name in SITE_HOST SITE_USER SITE_DIR; do
  if [[ -z "${!name:-}" ]]; then
    echo "Missing $name in $CONFIG_FILE" >&2
    exit 1
  fi
done

SITE_PORT="${SITE_PORT:-22}"
SSH_OPTIONS=(-p "$SITE_PORT")
if [[ -n "${SITE_SSH_KEY:-}" ]]; then
  SSH_OPTIONS+=(-i "$SITE_SSH_KEY")
fi

RSYNC_OPTIONS=(
  -az
  --delete
  --human-readable
  --exclude .git/
  --exclude .gitignore
  --exclude .env.deploy
  --exclude .env.deploy.example
  --exclude scripts/
  --exclude deploy/
  -e "ssh ${SSH_OPTIONS[*]}"
)

if [[ "$DEPLOY" == false ]]; then
  RSYNC_OPTIONS+=(--dry-run)
  echo "Dry run only. Re-run with --deploy to publish the website."
fi

echo "Syncing $ROOT_DIR to $SITE_USER@$SITE_HOST:$SITE_DIR"
rsync "${RSYNC_OPTIONS[@]}" "$ROOT_DIR/" "$SITE_USER@$SITE_HOST:$SITE_DIR/"

if [[ "$DEPLOY" == true ]]; then
  echo "Deployment complete: https://$SITE_HOST"
fi

