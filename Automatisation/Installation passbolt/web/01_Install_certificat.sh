#!/bin/bash

read -p "email login passbolt smtp tel que : ********** : " email_passbolt
email_passbolt="${email_passbolt,,}"
echo "$email_passbolt"

read -p "YOUR_NAME on passbolt tel que : JOHN : " YOUR_NAME
YOUR_NAME="${YOUR_NAME,,}"
echo "$YOUR_NAME"

read -p "YOUR_LASTNAME on passbolt tel que : DO : " YOUR_LASTNAME
YOUR_LASTNAME="${YOUR_LASTNAME,,}"
echo "$YOUR_LASTNAME"
 

read -p "url tel que : sous.dommaine.com : " urlServeur
urlServeur="${urlServeur,,}"
echo "$urlServeur"

read -p "email tel que : name@dommaine.com : " email
email="${email,,}"
echo "$email"

read -p "server smtp tel que : smtp.dommaine.com : " server_smtp
server_smtp="${server_smtp,,}"
echo "$server_smtp"

read -p "port smtp tel que : 25 : " port_smtp
port_smtp="${port_smtp,,}"
echo "$port_smtp"

read -p "username smtp tel que : name@dommaine.com : " username_smtp
username_smtp="${username_smtp,,}"
echo "$username_smtp"

read -p "password smtp tel que : ********** : " password_smtp
password_smtp="${password_smtp,,}"
echo "$password_smtp"



sudo apt-get update
sudo apt-get upgrade -y

sudo apt install certbot python3-certbot-nginx python3-pip python3.10-venv -y

sudo certbot --nginx \
  -d "$urlServeur"  \
  -d "www.$urlServeur"\
  --non-interactive \
  --agree-tos \
  --email "$email" \
  --redirect \
  --quiet

sudo service nginx stop

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

echo "fullchain=/etc/letsencrypt/live/$urlServeur/fullchain.pem" >> .env
echo "privkey=/etc/letsencrypt/live/$urlServeur/privkey.pem" >> .env
echo "domain=$urlServeur" >> .env
echo "email=$email" >> .env
echo "server_smtp=$server_smtp" >> .env
echo "port_smtp=$port_smtp" >> .env
echo "username_smtp=$username_smtp" >> .env
echo "password_smtp=$password_smtp" >> .env
echo "email_passbolt=$email_passbolt" >> .env
echo "YOUR_NAME=$YOUR_NAME" >> .env
echo "YOUR_LASTNAME=$YOUR_LASTNAME" >> .env

