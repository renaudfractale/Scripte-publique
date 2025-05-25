
# GitLab Docker Setup / Configuration de GitLab avec Docker

## 🇬🇧 English Instructions

### Prerequisites

- Use **Ubuntu 22.04 Server** or higher
- Have a cloud VM accessible via the internet  
  Ideally, use a C5 VM from [Paperspace](https://console.paperspace.com/)
- Have SSH access via a terminal

### Included Files (10)

- `01_install_docker.sh` → Installs Docker
- `02_run_init.sh` → Initializes the GitLab Docker container
- `03_run.sh` → Starts GitLab Docker in **attached** mode
- `04_run_detache.sh` → Starts GitLab Docker in **detached** mode
- `.env.example` → Example environment file to be copied
- `docker-compose.org.yml` → Original Docker Compose file [Not functional]
- `docker-compose.http.yml` → Docker Compose file using port 80 (HTTP)
- `docker-compose.https.yml` → Docker Compose file using port 443 (HTTPS) [Not functional]
- `docker-compose.yml` → Working Docker Compose file
- `stopAllDocker.sh` → Stops all Docker containers

---

### Step-by-Step Instructions

#### Step 1: Create your `.env` file

- Copy from `.env.example`
- Replace the domain name `gitlab.domain.com` with your own domain

#### Step 2: Edit `docker-compose.yml`

- Replace email `admin@domain.com` with your own
- Replace password `SecurePassword123!` with your secure password

#### Step 3: Copy the `web` folder to your VM

```bash
scp -r ./web user@XXX.XX.X.XX:~
```

- Replace `user` with your VM username  
- Replace `XXX.XX.X.XX` with your VM's IP address

#### Step 4: Configure DNS to point your domain to the VM's IP

- This depends on your domain name provider

#### Step 5: Install Docker

```bash
sudo bash 01_install_docker.sh
```

#### Step 6: Initialize GitLab Docker

⚠️ This will remove all previous Docker volumes and images

```bash
sudo bash 02_run_init.sh
```

Wait for Docker to pull the image and for files to be created in the `./gitlab` folder.

#### Step 7: Open GitLab in your browser

Go to: `http://localhost`  
Login credentials (from `docker-compose.yml`):

- **Login**: `admin@example.com`
- **Password**: `SecurePassword123`

#### Step 8: Restart GitLab if needed

- **Attached mode**:

  ```bash
  sudo bash 03_run.sh
  ```

- **Detached mode**:

  ```bash
  sudo bash 04_run_detache.sh
  ```

#### Step 9: Stop GitLab

```bash
sudo bash stopAllDocker.sh
```

---

## 🇫🇷 Instructions en français

### Pré-requis

- Utiliser **Ubuntu 22.04 Server** ou supérieur
- Avoir une VM accessible sur Internet  
  Idéalement, utilisez une VM C5 depuis [Paperspace](https://console.paperspace.com/)
- Avoir un accès SSH via un terminal

### Fichiers inclus (10)

- `01_install_docker.sh` → installe Docker
- `02_run_init.sh` → initialise le conteneur Docker GitLab
- `03_run.sh` → relance GitLab en **mode attaché**
- `04_run_detache.sh` → relance GitLab en **mode détaché**
- `.env.example` → exemple de fichier d'environnement à copier
- `docker-compose.org.yml` → fichier Docker Compose original [Non fonctionnel]
- `docker-compose.http.yml` → fichier Docker Compose utilisant le port 80 (HTTP)
- `docker-compose.https.yml` → fichier Docker Compose utilisant le port 443 (HTTPS) [Non fonctionnel]
- `docker-compose.yml` → fichier Docker Compose fonctionnel
- `stopAllDocker.sh` → stoppe tous les conteneurs Docker

---

### Étapes d’installation

#### Étape 1 : Créez un fichier `.env` à partir de `.env.example`

- Remplacez le nom de domaine `gitlab.domain.com` par votre nom de domaine

#### Étape 2 : Modifiez le fichier `docker-compose.yml`

- Remplacez l’adresse email `admin@domain.com` par la vôtre
- Remplacez le mot de passe `SecurePassword123!` par un mot de passe sécurisé

#### Étape 3 : Copiez le dossier `web` sur votre VM

```bash
scp -r ./web user@XXX.XX.X.XX:~
```

- Remplacez `user` par l’utilisateur de la VM  
- Remplacez `XXX.XX.X.XX` par l’adresse IP de la VM

#### Étape 4 : Redirigez votre nom de domaine vers l’IP de votre VM

- Cela dépend de votre fournisseur de nom de domaine

#### Étape 5 : Installez Docker

```bash
sudo bash 01_install_docker.sh
```

#### Étape 6 : Lancez l’initialisation de GitLab

⚠️ Cette étape supprime les volumes et images Docker précédents

```bash
sudo bash 02_run_init.sh
```

Attendez le temps que le conteneur se télécharge et que les fichiers soient créés dans le dossier `./gitlab`.

#### Étape 7 : Lancez votre navigateur sur l’URL suivante

`http://localhost`  
Identifiants présents dans `docker-compose.yml` :

- **Login** : `admin@example.com`
- **Mot de passe** : `SecurePassword123`

#### Étape 8 : Redémarrez GitLab si nécessaire

- **Mode attaché** :

  ```bash
  sudo bash 03_run.sh
  ```

- **Mode détaché** :

  ```bash
  sudo bash 04_run_detache.sh
  ```

#### Étape 9 : Arrêtez GitLab

```bash
sudo bash stopAllDocker.sh
```
