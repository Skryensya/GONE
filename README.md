# GONE

A minimal Docker service that returns `HTTP 410 Gone` for every request.

## Purpose

Useful for retiring domains — deploy this to a domain you no longer use so that crawlers, browsers, and APIs receive a proper 410 response, signaling that the resource is permanently gone. Google Search uses 410 to de-index URLs faster than a standard 404.

## Environment Variables

| Variable | Required | Description |
|---|---|---|
| `REDIRECT_URL` | No | If set, `GET /` redirects (301) to this URL. All other paths still return 410. |

## Usage

```bash
docker build -t gone .

# Everything returns 410
docker run -p 80:80 gone

# Root redirects to your new domain, everything else returns 410
docker run -p 80:80 -e REDIRECT_URL=https://newdomain.com gone
```

## Deploy

Point any Docker-compatible host (Coolify, Railway, Fly.io, etc.) at this repo. The container listens on port `80`.
