#!/bin/bash
set -e  
sudo apt update -y
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
# Création d'une page HTML 
HOSTNAME=$(hostname)
sudo tee /var/www/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>$HOSTNAME</title>
</head>
<body>
  <h1>Serveur : $HOSTNAME</h1>
  </body>
</html>
EOF
sudo systemctl status nginx --no-pager
echo "Installation Nginx terminée"
