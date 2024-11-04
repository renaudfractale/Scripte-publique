
read -p "pasword de postgres : " pasword
read -p "port : " port



# Fonction pour modifier ou ajouter une ligne dans un fichier
modify_config_line() {
    local FICHIER="$1"
    local CLE="$2"
    local VALEUR="$3"
    local LIGNE="$CLE $4 $VALEUR"
    echo "$LIGNE"

    # Vérification si le fichier existe
    if [ ! -f "$FICHIER" ]; then
        echo "Le fichier $FICHIER n'existe pas"
        return 1
    fi

    # Vérification si la ligne existe déjà
    if sudo grep -q "^$CLE" "$FICHIER"; then
        echo "Modification de $CLE dans $FICHIER..."
        sudo sed -i "s|^$CLE.*|$LIGNE|" "$FICHIER"
    else
        echo "Ajout de $CLE dans $FICHIER..."
        echo "$LIGNE" | sudo tee -a "$FICHIER" > /dev/null
    fi

    # Vérification
    echo "Vérification de $CLE :"
    sudo grep "^$CLE" "$FICHIER" || echo "Erreur : la ligne n'a pas été trouvée"
}



# MAJ du système 
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install net-tools -y

# Instalation de de postgresql last verstion 
# source : https://www.postgresql.org/download/linux/ubuntu/
sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
sudo apt install postgresql -y

# Modification du mot de passe de postgres
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$pasword'"

# 1/2 Copie des certificats server.key
sudo cp ./certificats_serveur/server.key /etc/ssl/private/server.key
sudo chown postgres:postgres /etc/ssl/private/server.key
sudo chmod 600 /etc/ssl/private/server.key

# 2/2 Copie des certificats server.crt
sudo cp ./certificats_serveur/server.crt  /etc/ssl/certs/server.crt
sudo chown postgres:postgres /etc/ssl/certs/server.crt
sudo chmod 644 /etc/ssl/certs/server.crt


# MAJ du fichier de conf /etc/postgresql/17/main/postgresql.conf
CONF_FILE_POSTGRESQL="/etc/postgresql/17/main/postgresql.conf"
# Modification de plusieurs paramètres
modify_config_line "$CONF_FILE_POSTGRESQL" "port " "$port" "="
modify_config_line "$CONF_FILE_POSTGRESQL" "listen_addresses " "'*'" "="
modify_config_line "$CONF_FILE_POSTGRESQL" "ssl " "on" "="
modify_config_line "$CONF_FILE_POSTGRESQL" "ssl_ca_file " "'/etc/ssl/certs/server.crt'" "="
modify_config_line "$CONF_FILE_POSTGRESQL" "ssl_cert_file " "'/etc/ssl/certs/server.crt'" "="
modify_config_line "$CONF_FILE_POSTGRESQL" "ssl_crl_file " "''" "="
modify_config_line "$CONF_FILE_POSTGRESQL" "ssl_key_file " "'/etc/ssl/private/server.key'" "="

# MAJ du fichier de conf /etc/postgresql/17/main/postgresql.conf
CONF_FILE_HBA="/etc/postgresql/17/main/pg_hba.conf"
# Modification de plusieurs paramètres
modify_config_line "$CONF_FILE_HBA" "hostssl " "  all          all             0.0.0.0/0             scram-sha-256" ""
    

# Ouverture du parfeux 
sudo iptables -A INPUT -p tcp --dport "$port" -j ACCEPT

# Restart postgresql :
sudo systemctl restart postgresql

# Statut  :
sudo systemctl status postgresql
