#!/bin/sh
set -e

IMAGE=gone-test
PORT=8099

docker build -t $IMAGE . > /dev/null

echo "\n--- Without REDIRECT_URL (everything should be 410) ---"
docker run -d --name $IMAGE-a -p ${PORT}:80 $IMAGE > /dev/null
sleep 1
curl -si http://localhost:${PORT}/ | head -1
curl -si http://localhost:${PORT}/some/page | head -1
docker rm -f $IMAGE-a > /dev/null

echo "\n--- With REDIRECT_URL=https://example.com (/ should 301, rest 410) ---"
docker run -d --name $IMAGE-b -p ${PORT}:80 -e REDIRECT_URL=https://example.com $IMAGE > /dev/null
sleep 1
curl -si http://localhost:${PORT}/ | head -2
curl -si http://localhost:${PORT}/some/page | head -1
docker rm -f $IMAGE-b > /dev/null

docker rmi $IMAGE > /dev/null
echo "\nDone."
