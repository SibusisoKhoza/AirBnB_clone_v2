#!/usr/bin/env bash
# Prepare your web servers

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y nginx
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "Hello AirBnb" | sudo tee /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test /data/web_static/current
sudo chown -R www-data:www-data /data/
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx restart
