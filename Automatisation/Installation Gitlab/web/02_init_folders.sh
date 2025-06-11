echo "Supression des dossiers"
rm -rf r gitlab/

echo "Création des dossiers"
mkdir ./gitlab -p
mkdir ./gitlab/config -p
mkdir ./gitlab/logs -p
mkdir ./gitlab/data -p
mkdir ./gitlab/certifs -p


echo "Création des droit des dossiers"
chmod 777 ./gitlab/config
chmod 777 ./gitlab/logs
chmod 777 ./gitlab/data
chmod 777 ./gitlab/certifs
