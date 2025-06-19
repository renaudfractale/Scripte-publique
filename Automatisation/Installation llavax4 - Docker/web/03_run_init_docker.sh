#!/bin/bash
# Arrêter tous les conteneurs
docker stop $(docker ps -aq)

# Supprimer tous les conteneurs
docker rm $(docker ps -aq)

# Supprimer toutes les images
docker rmi $(docker images -q)

# Supprimer tous les volumes
docker volume rm $(docker volume ls -q)

# Supprimer tous les réseaux
docker network rm $(docker network ls | grep "bridge" | awk '{print $1}')

# Nettoyer le système Docker (supprime conteneurs, images, volumes et réseaux inutiles)
docker system prune -a -y

# Supprimer le répertoire de configuration (facultatif)
rm -rf ~/.docker/

# Redémarrer Docker
systemctl restart docker

docker compose up --build
