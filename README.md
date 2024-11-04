# Scripts d'installation PostgreSQL avec SSL

Ce répertoire contient trois scripts permettant l'installation et la configuration sécurisée de PostgreSQL 17 avec SSL.

## Prérequis

- Système d'exploitation Linux (Debian/Ubuntu)
- Droits sudo
- OpenSSL installé

## Scripts disponibles

### 1. `new_server.sh`

Crée un nouveau dossier "Serveur XX" contenant les certificats SSL nécessaires pour un serveur PostgreSQL.

```bash
./new_server.sh
```

**Contenu du dossier généré :**
- `server.crt` : Certificat du serveur
- `server.key` : Clé privée du serveur

### 2. `new_client.sh`

Crée un nouveau dossier "Client XX" contenant les certificats SSL nécessaires pour un client PostgreSQL.

```bash
./new_client.sh
```

**Contenu du dossier généré :**
- `client.crt` : Certificat client
- `client.key` : Clé privée client
- `client.csr` : Demande de signature de certificat

### 3. `install_postgresql.sh`

Script d'installation automatique de PostgreSQL 17.

```bash
./install_postgresql.sh
```

**Paramètres demandés lors de l'installation :**
- Port d'écoute PostgreSQL (défaut : 5432)
- Mot de passe pour l'utilisateur 'postgres'

mettre des le dossier `certificats_serveur` les certificats serveur :
- `server.crt` : Certificat du serveur
- `server.key` : Clé privée du serveur

## Notes de sécurité

- Conservez les clés privées dans un endroit sécurisé
- Sauvegardez les certificats
- Renouvelez les certificats avant leur expiration
- Ne partagez jamais les clés privées

## Support

En cas de problème :
- Vérifiez les logs PostgreSQL : `tail -f /var/log/postgresql/postgresql-17-main.log`
- Assurez-vous que les permissions des fichiers sont correctes
- Vérifiez que le service PostgreSQL est démarré : `systemctl status postgresql`
