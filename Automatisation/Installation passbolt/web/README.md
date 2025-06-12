## 🇬🇧 English

This project automates the setup and deployment of a secure [Passbolt](https://www.passbolt.com/) server using Docker, with full SSL certificate and configuration.

### 📁 Script Overview

| Script                      | Description                                                                 |
|----------------------------|-----------------------------------------------------------------------------|
| `01_Install_certificat.sh` | Prompts for SSL, admin, and SMTP info + updates OS + installs Nginx + creates `.env` |
| `02_install_docker.sh`     | Installs Docker                                                             |
| `03_run_init.sh`           | Resets and configures Passbolt in Docker                                    |
| `04_create_compte_admin.sh`| Starts Passbolt and creates the admin account                              |
| `05_run.sh`                | Runs Passbolt in attached mode (interactive)                               |
| `06_run_detache.sh`        | Runs Passbolt in detached mode (background)                                |
| `docker-compose.yml`       | Docker Compose configuration for Passbolt                                  |
| `stopAllDocker.sh`         | Stops all running Docker containers                                        |

### ⚙️ Requirements

- Ubuntu Server 22.04
- Root or `sudo` access
- A domain name pointing to your server
- Open **80** and **443** ports

### 🚀 Installation Example

```bash
./01_Install_certificat.sh
./02_install_docker.sh
./03_run_init.sh
./04_create_compte_admin.sh
./06_run_detache.sh
```

> 📧 The admin password will be emailed via the configured SMTP server.

### 🛑 Stop all containers

```bash
./stopAllDocker.sh
```

---


# 🔐 Déploiement d’un Serveur Passbolt sur Ubuntu 22.04 / Deploying a Passbolt Server on Ubuntu 22.04

## 🇫🇷 Français

Ce projet automatise l'installation et la configuration d’un serveur [Passbolt](https://www.passbolt.com/) sécurisé via Docker, avec génération de certificat SSL et configuration complète.

### 📁 Contenu des scripts

| Script                      | Description                                                                 |
|----------------------------|-----------------------------------------------------------------------------|
| `01_Install_certificat.sh` | Demande les infos SSL, compte admin, SMTP + met à jour l’OS + installe Nginx et crée le `.env` |
| `02_install_docker.sh`     | Installe Docker                                                             |
| `03_run_init.sh`           | Réinitialise et configure Passbolt dans Docker                             |
| `04_create_compte_admin.sh`| Démarre Passbolt et crée le compte admin                                   |
| `05_run.sh`                | Lance Passbolt en mode attaché (interactif)                                |
| `06_run_detache.sh`        | Lance Passbolt en mode détaché (en arrière-plan)                           |
| `docker-compose.yml`       | Configuration Docker Compose pour Passbolt                                 |
| `stopAllDocker.sh`         | Stoppe tous les conteneurs Docker                                          |

### ⚙️ Prérequis

- Ubuntu Server 22.04
- Accès root ou `sudo`
- Nom de domaine pointant vers le serveur
- Ports **80** et **443** ouverts

### 🚀 Exemple d’installation

```bash
./01_Install_certificat.sh
./02_install_docker.sh
./03_run_init.sh
./04_create_compte_admin.sh
./06_run_detache.sh
```

> 📧 Le mot de passe admin est envoyé par email via le serveur SMTP configuré.

### 🛑 Arrêt des conteneurs

```bash
./stopAllDocker.sh
```

