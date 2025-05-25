
# GitLab Docker Setup / Configuration de GitLab avec Docker

## 🇬🇧 English Instructions

### Prerequisites

- Use **Ubuntu 22.04 Server** or higher (Windows WSL is compatible)

### Files Included

There are 7 files:

- `01_install_docker.sh` → Installs Docker
- `02_run_init.sh` → Initializes the GitLab Docker container
- `03_run.sh` → Starts GitLab Docker in **attached** mode
- `04_run_detache.sh` → Starts GitLab Docker in **detached** mode
- `docker-compose.org.yml` → Original Docker Compose file
- `docker-compose.yml` → Functional Docker Compose file
- `stopAllDocker.sh` → Stops all Docker containers

---

### Step-by-Step Instructions

#### Step 1: Install Docker

```bash
sudo bash 01_install_docker.sh
```

#### Step 2: Initialize GitLab Docker and Related Folders

⚠️ This will remove all previously installed Docker volumes and images.

```bash
sudo bash 02_run_init.sh
```

Wait for the image to download and for files to be created in the `./gitlab` folder.

#### Step 3: Open GitLab in Browser

Go to: `http://localhost`

Use the credentials defined in `docker-compose.yml`:

- **Login**: `admin@example.com`
- **Password**: `SecurePassword123`

#### Step 4: Restart GitLab

- **Attached mode**:

  ```bash
  sudo bash 03_run.sh
  ```

- **Detached mode**:

  ```bash
  sudo bash 04_run_detache.sh
  ```

#### Step 5: Stop GitLab

```bash
sudo bash stopAllDocker.sh
```

---

## 🇫🇷 Instructions en français

### Pré-requis

- Utiliser **Ubuntu 22.04 Server** ou supérieur (WSL de Windows compatible)

### Fichiers disponibles

Il y a 7 fichiers :

- `01_install_docker.sh` → installe Docker
- `02_run_init.sh` → initialise le conteneur Docker GitLab
- `03_run.sh` → relance GitLab en **mode attaché**
- `04_run_detache.sh` → relance GitLab en **mode détaché**
- `docker-compose.org.yml` → fichier Docker Compose original
- `docker-compose.yml` → fichier Docker Compose fonctionnel
- `stopAllDocker.sh` → stoppe tous les conteneurs Docker

---

### Étapes d’installation

#### Étape 1 : Installer Docker

```bash
sudo bash 01_install_docker.sh
```

#### Étape 2 : Initialiser GitLab et les dossiers associés

⚠️ Cela supprime tous les volumes et images Docker précédemment installés.

```bash
sudo bash 02_run_init.sh
```

Attendez le temps que le conteneur soit téléchargé et que les fichiers soient créés dans le dossier `./gitlab`.

#### Étape 3 : Accéder à GitLab via le navigateur

Ouvrir : `http://localhost`

Identifiants présents dans `docker-compose.yml` :

- **Login** : `admin@example.com`
- **Mot de passe** : `SecurePassword123`

#### Étape 4 : Relancer GitLab

- **Mode attaché** :

  ```bash
  sudo bash 03_run.sh
  ```

- **Mode détaché** :

  ```bash
  sudo bash 04_run_detache.sh
  ```

#### Étape 5 : Stopper GitLab

```bash
sudo bash stopAllDocker.sh
```
