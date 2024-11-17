#!/bin/bash

# Fonction pour afficher le menu
afficher_menu() {
    clear
    echo "================================"
    echo "           MENU PRINCIPAL        "
    echo "================================"
    echo "1 - ubuntu 20.04"
    echo "2 - ubuntu 22.04"
    echo "3 - ubuntu 24.04"
    echo "4 - Quitter"
    echo "================================"
    echo "Entrez votre choix [1-4]: "
}

versionUbuntu=""
# Boucle principale
while true; do
    afficher_menu
    read -r choix
    
    case $choix in
        1)
            versionUbuntu="ubuntu2004"
            break
            ;;
        2)
            versionUbuntu="ubuntu2204"
            break
            ;;
        3)
            versionUbuntu="ubuntu2404"
            break
            ;;
        4)
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Choix invalide. Veuillez réessayer."
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
    esac
done

echo "$versionUbuntu"

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


wget "https://developer.download.nvidia.com/compute/cuda/repos/$versionUbuntu/x86_64/cuda-keyring_1.1-1_all.deb"
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get upgrade -y

# Install Drivre cuda
sudo apt install nvidia-driver-535 -y  # Utilisez la version la plus récente compatible
sudo apt-get -y install cuda-toolkit
sudo apt-get -y install cudnn
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