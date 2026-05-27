#!/bin/sh

if [ -n "$REDIRECT_URL" ]; then
  cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen 80;

    location = / {
        return 301 $REDIRECT_URL;
    }

    location / {
        return 410;
    }
}
EOF
else
  cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen 80;

    location / {
        return 410;
    }
}
EOF
fi

exec nginx -g "daemon off;"
