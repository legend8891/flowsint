#!/usr/bin/env bash
# Creates .env files with fresh random secrets (only on first run).
set -euo pipefail
cd "$(dirname "$0")/.."
if [ -f .env ]; then echo ".env already exists - keeping existing secrets"; exit 0; fi
AUTH=$(openssl rand -hex 32)
VAULT="base64:$(python3 -c 'import os,base64;print(base64.b64encode(os.urandom(32)).decode())')"
NEO=$(openssl rand -hex 16)
PG=$(openssl rand -hex 16)
sed -e "s|^AUTH_SECRET=.*|AUTH_SECRET=${AUTH}|" \
    -e "s|^MASTER_VAULT_KEY_V1=.*|MASTER_VAULT_KEY_V1=${VAULT}|" \
    -e "s|^NEO4J_PASSWORD=.*|NEO4J_PASSWORD=${NEO}|" \
    -e "s|^DATABASE_URL=.*|DATABASE_URL=postgresql://flowsint:${PG}@localhost:5433/flowsint|" \
    .env.example > .env
echo "POSTGRES_PASSWORD=${PG}" >> .env
for d in flowsint-api flowsint-core flowsint-app; do cp .env "$d/.env"; done
chmod 600 .env flowsint-*/.env
echo "Created .env files with random secrets."
