#echo "Supression des dossiers"
#rm -rf r gitlab/

#echo "Création des dossiers"
#mkdir ./gitlab -p
#mkdir ./gitlab/config -p
#mkdir ./gitlab/logs -p
#mkdir ./gitlab/data -p

#echo "Création des droit des dossiers"
#chmod 777 ./gitlab/config
#chmod 777 ./gitlab/logs
#chmod 777 ./gitlab/data

echo "Stop all nginx"
sudo service nginx stop

echo "Stop all docker"
docker stop $(sudo docker ps -a -q)

echo "Prune all docker"
docker system prune -a -f
docker volume prune -a -f

echo "Run docker"
docker compose up