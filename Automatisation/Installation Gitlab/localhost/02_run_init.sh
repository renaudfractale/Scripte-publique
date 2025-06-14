echo "Supression des dossiers"
rm -rf r gitlab/

echo "Création des dossiers"
mkdir ./gitlab -p
mkdir ./gitlab/config -p
mkdir ./gitlab/logs -p

echo "Création des droit des dossiers"
chmod 777 ./gitlab/config
chmod 777 ./gitlab/logs

echo "Stop all docker"
docker stop $(sudo docker ps -a -q)

echo "Prune all docker"
docker system prune -a -f --volumes


echo "Run docker"
docker compose up