# 🔍 Multi-GPU Image Analysis System with Docker & HAProxy

## 🇬🇧 English - Overview

This repository contains everything needed to run 4 Python API servers for image analysis using a **Paperspace V100 (32G x4) system** with **250 GB disk**. The APIs run in Docker containers and are load-balanced using **HAProxy**.

### 🚀 Architecture

- 4 API servers (`app`) analyzing images.
- 1 HAProxy container for load balancing requests.
- NVIDIA GPU acceleration using CUDA and `nvidia-docker`.


### 📂 Repository Structure

```
.
├── 01_install_docker.sh        # OS update and Docker installation
├── 02_install_nvidia.sh        # NVIDIA drivers and toolkit installation
├── 03_run_init_docker.sh       # Docker reset and run in attached mode
├── 04_run_docker_attache.sh    # Run docker in attached mode
├── 05_run_docker_detache.sh    # Run docker in detached mode
├── docker-compose.yml          # Docker Compose setup
├── test.jpg                    # Sample test image
├── test.sh                     # Bash test script
├── app/                        # Python API source folder
│   ├── Dockerfile              # Dockerfile for API image analysis app
│   ├── main.py                 # Main Python script for image processing
│   └── requirements.txt        # Python dependencies
└── haproxy/
    └── haproxy.cfg             # HAProxy load balancing configuration
```


### ⚙️ Quick Start

bash 01_install_docker.sh
bash 02_install_nvidia.sh
bash 03_run_init_docker.sh
bash 04_run_docker_attache.sh
bash 05_run_docker_detache.sh

### 🧪 Test the API

bash test.sh

---

## 🇫🇷 Français - Présentation

Ce dépôt permet de déployer 4 serveurs API Python d’analyse d’images avec Docker sur une machine **Paperspace V100 (32G x4)** équipée de **250 Go de disque**. Le trafic est équilibré avec **HAProxy** et l'accélération GPU est activée.

### 🧱 Architecture

- 4 serveurs API Python (`app`) pour analyser les images.
- 1 conteneur HAProxy pour répartir les requêtes.
- Accélération GPU via CUDA avec `nvidia-docker`.


### 📁 Structure du dépôt

```
.
├── 01_install_docker.sh        # Mise à jour du système et installation de Docker
├── 02_install_nvidia.sh        # Installation des drivers NVIDIA et outils CUDA
├── 03_run_init_docker.sh       # Réinitialisation et exécution de Docker en mode attaché
├── 04_run_docker_attache.sh    # Lancement du Docker en mode attaché
├── 05_run_docker_detache.sh    # Lancement du Docker en mode détaché
├── docker-compose.yml          # Configuration docker-compose
├── test.jpg                    # Image de test
├── test.sh                     # Script bash de test
├── app/                        # Dossier contenant l'application API Python
│   ├── Dockerfile              # Dockerfile de l'application d’analyse d’image
│   ├── main.py                 # Script principal d’analyse
│   └── requirements.txt        # Dépendances Python
└── haproxy/
    └── haproxy.cfg             # Configuration de l’équilibrage de charge HAProxy
```

### ⚙️ Démarrage rapide

bash 01_install_docker.sh
bash 02_install_nvidia.sh
bash 03_run_init_docker.sh
bash 04_run_docker_attache.sh
bash 05_run_docker_detache.sh

### 🧪 Tester l'API

bash test.sh

---

🛠️ *Optimisé pour les systèmes avec GPU NVIDIA sur Paperspace. Pensez à adapter les scripts si votre environnement diffère.*
