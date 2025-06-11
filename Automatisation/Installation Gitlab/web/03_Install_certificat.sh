#!/bin/bash
read -p "url tel que : sous.dommaine.com : " urlServeur
urlServeur="${urlServeur,,}"
echo "$urlServeur"

read -p "email tel que : name@dommaine.com : " email
email="${email,,}"
echo "$email"

read -p "password gitlab tel que : ********* : " password_gitlab
password_gitlab="${password_gitlab,,}"
echo "$password_gitlab"

sudo apt-get update
sudo apt-get upgrade -y

sudo pkill -f nginx

sudo apt install nginx certbot python3-certbot-nginx python3-pip python3.10-venv -y

sudo service nginx stop
"""
sudo certbot --nginx \
  -d "$urlServeur"  \
  -d "www.$urlServeur"\
  --non-interactive \
  --agree-tos \
  --email "$email" \
  --redirect \
  --quiet
"""

#sudo service nginx stop

cp -f "/etc/letsencrypt/live/$urlServeur/fullchain.pem"  "./gitlab/certif/$urlServeur.crt"
cp -f "/etc/letsencrypt/live/$urlServeur/privkey.pem"  "./gitlab/certif/$urlServeur.key"

chmod 600 "./gitlab/certif/$urlServeur.crt"
chmod 600 "./gitlab/certif/$urlServeur.key"

if [ -f ".env" ]; then
    echo "Le fichier '.env' existe"
    echo "voulez vous l'écraser ?"
    read -p "yes/no : " yesNo
    if [ "$yesNo" = "yes" ]; then
        echo "La valeur est yes"
        echo "On supprimme .env"
        rm -f .env
    else
        echo "La valeur est no"
        echo "On quitte"
        exit 0
    fi
fi

echo "fullchain=./gitlab/certif/$urlServeur.crt" >> .env
echo "privkey=./gitlab/certif/$urlServeur.key" >> .env
echo "domain=$urlServeur" >> .env
echo "email=$email" >> .env
echo "password_gitlab=$password_gitlab" >> .env



echo "Stop all nginx"
sudo service nginx stop