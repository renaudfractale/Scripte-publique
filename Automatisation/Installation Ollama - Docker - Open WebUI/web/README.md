# Installing Ollama and Open-WebUI on Ubuntu 22.04 with Docker

This repository contains a set of scripts to install and configure Ollama and Open-WebUI on an Ubuntu 22.04 server with an A100-80G graphics card from Paperspace. The scripts are designed to be executed in order to ensure a successful installation.

## Prerequisites

* Ubuntu 22.04 server
* A100-80G graphics card from Paperspace
* Internet access

## Installation Scripts

1. **01_Install_certificat.sh** : Creates the SSL certificate for the domain name and restarts the VM.
    * Asks for the domain and associated email
    * Asks for the proxy login and password
2. **02_install_docker.sh** : Installs Docker
3. **03_install_nvidia.sh** : Installs NVIDIA drivers and links them to Docker, then restarts the VM
4. **04_run_init_docker.sh** : (Run only once) Resets Docker, configures Docker, and launches Ollama and Open-WebUI in attached mode
5. **05_run_docker_attache.sh** : Launches Ollama and Open-WebUI in attached mode
6. **06_run_docker_detache.sh** : Launches Ollama and Open-WebUI in detached mode

## Configuration Files

* **docker-compose.yml** : Docker-compose configuration for the system
* **include** : Directory containing generic Nginx configuration files
* **docker-compose-org.yml** : Original Docker-compose configuration for the system

## LLM Installation Example

* **install_llm.txt** : Example command to install LLMs in the Ollama Docker container

## Installation Steps

1. Clone this repository on your Ubuntu 22.04 server
2. Run the scripts in order:
    * `01_Install_certificat.sh`
    * `02_install_docker.sh`
    * `03_install_nvidia.sh`
    * `04_run_init_docker.sh` (only once)
3. Configure your Nginx proxy with the requested login and password
4. Run the scripts to launch Ollama and Open-WebUI:
    * `05_run_docker_attache.sh` for attached mode
    * `06_run_docker_detache.sh` for detached mode

## Warnings

* Make sure you understand the scripts before running them
* The scripts are designed to be run in order and may cause problems if run out of order
* It is recommended to make regular backups of your important data

We hope this repository helps you install and configure Ollama and Open-WebUI on your Ubuntu 22.04 server with an A100-80G graphics card from Paperspace.

# Installation d'Ollama et Open-WebUI sur Ubuntu 22.04 avec Docker

Ce dépôt contient un ensemble de scripts pour installer et configurer Ollama et Open-WebUI sur un serveur Ubuntu 22.04 avec une carte graphique A100-80G de Paperspace. Les scripts sont conçus pour être exécutés dans l'ordre pour assurer une installation réussie.

## Prérequis

* Serveur Ubuntu 22.04
* Carte graphique A100-80G de Paperspace
* Accès à Internet

## Scripts d'installation

1. **01_Install_certificat.sh** : Crée le certificat SSL du nom de domaine et redémarre la VM.
    * Demande le domain et le mail associé
    * Demande le login et le mot de passe du proxy
2. **02_install_docker.sh** : Installe Docker
3. **03_install_nvidia.sh** : Installe les drivers NVIDIA et les lie à Docker, puis redémarre la VM
4. **04_run_init_docker.sh** : (À lancer qu'une seule fois) Met à zéro Docker, configure Docker et lance Ollama et Open-WebUI en mode attaché
5. **05_run_docker_attache.sh** : Lance Ollama et Open-WebUI en mode attaché
6. **06_run_docker_detache.sh** : Lance Ollama et Open-WebUI en mode détaché

## Fichiers de configuration

* **docker-compose.yml** : Docker-compose du système
* **include** : Dossier de la configuration générique de Nginx
* **docker-compose-org.yml** : Docker-compose du système original

## Exemple d'installation de LLM

* **install_llm.txt** : Exemple de commande pour installer des LLM dans le Docker Ollama

## Étapes d'installation

1. Clonez ce dépôt sur votre serveur Ubuntu 22.04
2. Exécutez les scripts dans l'ordre :
    * `01_Install_certificat.sh`
    * `02_install_docker.sh`
    * `03_install_nvidia.sh`
    * `04_run_init_docker.sh` (une seule fois)
3. Configurez votre proxy Nginx avec le login et le mot de passe demandés
4. Exécutez les scripts pour lancer Ollama et Open-WebUI :
    * `05_run_docker_attache.sh` pour mode attaché
    * `06_run_docker_detache.sh` pour mode détaché

## Avertissements

* Assurez-vous de bien comprendre les scripts avant de les exécuter
* Les scripts sont conçus pour être exécutés dans l'ordre et peuvent causer des problèmes si exécutés hors de cet ordre
* Il est recommandé de faire des sauvegardes régulières de vos données importantes

Nous espérons que ce dépôt vous aidera à installer et configurer Ollama et Open-WebUI sur votre serveur Ubuntu 22.04 avec une carte graphique A100-80G de Paperspace.