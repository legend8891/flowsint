# Run Flowsint in GitHub Codespaces (no admin rights needed)

1. On this repo page click **Code → Codespaces → Create codespace on main**.
   - Pick the **4-core / 16 GB** machine (Neo4j + Postgres + Redis need the RAM).
2. Wait for setup. It automatically:
   - creates `.env` files with **fresh random secrets** (never committed — `.env` is git-ignored),
   - pulls the pre-built Flowsint images and starts them.
3. First start takes 2–4 minutes. Open the **PORTS** tab → port **5173** → globe icon.
4. Go to `/register` on that URL and create your account.

## Useful commands
```bash
docker compose -f docker-compose.prod.yml ps        # status
docker compose -f docker-compose.prod.yml logs -f api   # API logs
docker compose -f docker-compose.prod.yml restart app   # restart UI
```

## Notes
- Keep port 5173 **Private** (default). Only you, signed in to GitHub, can open it.
- Stop the codespace when finished to save your free monthly hours
  (github.com/codespaces → … → Stop).
- Your data lives in Docker volumes inside the codespace; deleting the codespace deletes it.
- Pull upstream updates: `git fetch upstream && git merge upstream/main`.
- Use for lawful, authorised research only — see `ETHICS.md`.
