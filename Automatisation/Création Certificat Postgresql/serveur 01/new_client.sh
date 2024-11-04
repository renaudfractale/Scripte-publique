#!/bin/bash

# Fichier pour stocker le dernier numéro utilisé
COUNTER_FILE="last_client_number.txt"

# Si le fichier n'existe pas, commencer à 0
if [ ! -f "$COUNTER_FILE" ]; then
    echo "0" > "$COUNTER_FILE"
fi

# Lire le dernier numéro et l'incrémenter
last_number=$(cat "$COUNTER_FILE")
new_number=$((last_number + 1))

# Formater le numéro sur 2 chiffres (01, 02, etc.)
formatted_number=$(printf "%03d" $new_number)

# Créer le nom du dossier
folder_name="client $formatted_number"

# Créer le dossier
mkdir -p "$folder_name"

# Se déplacer dans le dossier
cd "$folder_name"

# Génération de la clé et de la demande de certificat
openssl req -new -nodes -out client.csr -keyout client.key \
    -subj "/C=FR/ST=State/L=City/O=Organization/OU=Unit/CN=client$formatted_number"

# Génération du certificat client signé avec le certificat serveur
openssl x509 -req -in client.csr \
    -CA ../server.crt \
    -CAkey ../server.key \
    -CAcreateserial \
    -out client.crt \
    -days 3650

# Sauvegarder le nouveau numéro
echo "$new_number" > "../$COUNTER_FILE"

echo "Certificat client créé dans le dossier $client_folder"