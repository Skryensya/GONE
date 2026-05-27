# GONE

A minimal Docker service that returns `HTTP 410 Gone` for every request.

## Purpose

Useful for retiring domains — deploy this to a domain you no longer use so that crawlers, browsers, and APIs receive a proper 410 response, signaling that the resource is permanently gone. Google Search uses 410 to de-index URLs faster than a standard 404.

## Usage

```bash
docker build -t gone .
docker run -p 80:80 gone
```

## Deploy

Point any Docker-compatible host (Coolify, Railway, Fly.io, etc.) at this repo. The container listens on port `80` and returns `410 Gone` for all routes.
