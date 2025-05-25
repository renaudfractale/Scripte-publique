echo "Stop all nginx"
sudo service nginx stop

echo "Stop all docker"
docker stop $(sudo docker ps -a -q)

echo "Run docker"
docker compose up
