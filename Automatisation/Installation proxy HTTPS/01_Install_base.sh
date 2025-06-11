#!/bin/bash

read -p "url tel que : sous.dommaine.com : " urlServeur
urlServeur="${urlServeur,,}"
echo "$urlServeur"

read -p "email tel que : name@dommaine.com : " email
email="${email,,}"
echo "$email"

read -p "userProxy tel que : user01 : " userProxy
echo "$userProxy"

read -p "userProxy tel que : ******* : " passwordProxy
echo "$passwordProxy"


sudo apt-get update
sudo apt-get upgrade -y

sudo apt install certbot python3-certbot-nginx apache2-utils python3-pip python3.10-venv -y

sudo certbot --nginx \
  -d "$urlServeur"  \
  -d "www.$urlServeur"\
  --non-interactive \
  --agree-tos \
  --email "$email" \
  --redirect \
  --quiet

cp -f ./include/default  default

regex="s/\(.*\)sous.domaine.com\(.*\)/\1$urlServeur\2/g"
#echo "$regex" 
sed -i "$regex" default 


regex="s/\(.*\)sous.domaine.com/\1$urlServeur/g"
#echo "$regex" 
sed -i "$regex" default 

sudo cp -f ./default /etc/nginx/sites-available/
sudo chmod 644 /etc/nginx/sites-available/default


sudo htpasswd -bc /etc/nginx/.htpasswd "$userProxy" "$passwordProxy"

sudo reboot