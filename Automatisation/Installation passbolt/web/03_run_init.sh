echo "Stop all nginx"
sudo service nginx stop

echo "Stop all docker"
docker stop $(sudo docker ps -a -q)

echo "Prune all docker"
docker system prune -a -f
docker volume prune -a -f

echo "Run docker"
docker compose up
