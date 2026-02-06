#!/bin/sh
set -e


apk update
apk add nginx
rc-update add nginx default
rc-service nginx start

# Crée une page HTML simple
HOSTNAME=$(hostname)
cat <<EOF > /var/www/localhost/htdocs/index.html
<!DOCTYPE html>
<html>
<head>
  <title>SITE ALPINE NGINX</title>
</head>
<body>
  <h1>Serveur : SITE ALPINE NGINX</h1>
</body>
</html>
EOF

# Vérifie que nginx tourne
rc-service nginx status

echo "Installation Nginx terminée"
