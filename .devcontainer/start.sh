#!/usr/bin/env bash
# Starts Flowsint from pre-built images each time the Codespace starts.
set -uo pipefail
cd "$(dirname "$0")/.."
for i in $(seq 1 30); do docker info >/dev/null 2>&1 && break; sleep 2; done
docker compose -f docker-compose.prod.yml pull --quiet
docker compose -f docker-compose.prod.yml up -d
echo ""
echo "Flowsint is starting (first run takes 2-4 minutes while Neo4j initialises)."
echo "Open the PORTS tab -> port 5173 -> globe icon, then go to /register to create your account."
echo "Check status:  docker compose -f docker-compose.prod.yml ps"
