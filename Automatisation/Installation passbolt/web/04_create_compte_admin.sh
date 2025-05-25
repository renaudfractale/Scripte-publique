echo "Stop all nginx"
sudo service nginx stop

echo "Stop all docker"
docker stop $(sudo docker ps -a -q)

echo "Run docker"
docker compose up -d

echo "sleep 20 secondes"
sleep 20

set -a
source .env
set +a

echo "email used : "
echo "$email_passbolt"
echo "docker exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake   passbolt register_user     -u "$email" -f "$YOUR_NAME"   -l "$YOUR_LASTNAME" -r admin" -s /bin/sh www-data"
sudo docker exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
  passbolt register_user \
    -u "$email_passbolt" \
    -f "$YOUR_NAME" \
    -l "$YOUR_LASTNAME" \
    -r admin" -s /bin/sh www-data