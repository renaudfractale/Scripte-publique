#!/bin/bash

# Fichier pour stocker le dernier numéro utilisé
COUNTER_FILE="last_server_number.txt"

# Si le fichier n'existe pas, commencer à 0
if [ ! -f "$COUNTER_FILE" ]; then
    echo "0" > "$COUNTER_FILE"
fi

# Lire le dernier numéro et l'incrémenter
last_number=$(cat "$COUNTER_FILE")
new_number=$((last_number + 1))

# Formater le numéro sur 2 chiffres (01, 02, etc.)
formatted_number=$(printf "%02d" $new_number)

# Créer le nom du dossier
folder_name="serveur $formatted_number"

# Créer le dossier
mkdir -p "$folder_name"

# Se déplacer dans le dossier
cd "$folder_name"

# Génération du certificat SSL
openssl req -new -x509 -days 3650 -nodes -out server.crt -keyout server.key \
    -subj "/C=FR/ST=State/L=City/O=Organization/OU=Unit/CN=server$formatted_number"

# Sauvegarder le nouveau numéro
echo "$new_number" > "../$COUNTER_FILE"

# Copie du bash de la création des certificats clients
cp ../include/new_client.sh ./new_client.sh

echo "Certificat créé dans le dossier $folder_name"