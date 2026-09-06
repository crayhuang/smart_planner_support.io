#!/usr/bin/env bash
set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run with sudo: sudo ./scripts/server-setup.sh support.example.com" >&2
  exit 1
fi

DOMAIN="${1:-}"
if [[ -z "$DOMAIN" || ! "$DOMAIN" =~ ^[A-Za-z0-9.-]+$ ]]; then
  echo "Usage: sudo $0 <domain>" >&2
  exit 64
fi

SITE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
VHOST_PATH="/etc/nginx/sites-available/smart-planner"
VHOST_LINK="/etc/nginx/sites-enabled/smart-planner"

apt-get update
apt-get install -y nginx

cat > "$VHOST_PATH" <<EOF
server {
    listen 80;
    listen [::]:80;
    server_name $DOMAIN;

    root $SITE_ROOT;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~* \.(?:css|jpg|jpeg|png|webp|svg|ico)$ {
        expires 7d;
        add_header Cache-Control "public";
    }
}
EOF

ln -sfn "$VHOST_PATH" "$VHOST_LINK"
nginx -t
systemctl enable --now nginx
systemctl reload nginx

echo "Nginx is serving $SITE_ROOT for http://$DOMAIN"
echo "After DNS resolves, install HTTPS with:"
echo "  sudo apt-get install -y certbot python3-certbot-nginx"
echo "  sudo certbot --nginx -d $DOMAIN"
