---
title: rapport.md
author 1: Lefebvre Romain
author 2: Plantard Kylian
author 3: Belot   Emilien
date: 16/02/2026
---



# Introduction

Ce rapport présente le travail réalisé lors des semaines S07 et S08 dans le cadre de la SAÉ 2.03 « Installation de services réseaux ».

Il est rédigé en **Markdown étendu** (Pandoc) et vise à montrer une variété de techniques de mise en forme.

> [!IMPORTANT]
> Tous les membres de l'équipe ont participé à la rédaction et à la vérification des étapes.

## Membres de l'équipe

| Nom      | Prénom  |
| -------- | ------- |
| Lefebvre | Romain  |
| Plantard | Kylian  |
| Belot    | Emilien |

## Objectifs de la SAÉ (rappel)

> [!NOTE]
> La problématique professionnelle est de **préparer un serveur** pour répondre à un besoin client en installant et configurant des services réseau.

Objectifs principaux :

- Maîtriser l'installation et la configuration d'une VM Debian
- Découvrir et utiliser un balisage léger (Markdown + Pandoc)
- Préparer une procédure d'installation automatisée
- Rédiger un compte-rendu technique clair et sourcé

# Semaine S07 – Préparation de la machine virtuelle

## Configuration matérielle VirtualBox

Nous avons créé une machine virtuelle nommée **sae203** avec les caractéristiques suivantes :

- Type : Linux – Debian (64-bit)
- RAM : **2048 Mo**
- Disque : 20 Go dynamique
- Réseau par défaut : **NAT**

### Réponses aux questions posées

1. Que signifie « 64-bit » dans « Debian 64-bit » ?  
   → Cela indique que le système supporte les processeurs 64 bits et peut adresser plus de 4 Go de RAM.[^deb64]

2. Quelle est la configuration réseau utilisée par défaut ?  
   → **NAT** (Network Address Translation)

3. Pourquoi allouer 2048 Mo de RAM ?  
   → Pour éviter des ralentissements importants avec l'environnement graphique MATE. Avec 512 Mo, le système serait très lent voire inutilisable pour des tâches graphiques.

4. Quelle est l'adresse IP de la VM ? Comment l'avez-vous obtenue ?  
   → Exemple : 10.0.2.15 (obtenue via DHCP du réseau NAT de VirtualBox)

5. Adresse de la passerelle par défaut ?  
   → 10.0.2.2 – correspond au routeur virtuel fourni par VirtualBox en mode NAT

[^deb64]: Source : [Documentation Debian – Architecture 64 bits](https://www.debian.org/releases/stable/amd64/)

## Installation du système

Nous avons utilisé l'ISO **Debian 13** (netinst) avec les paramètres suivants :

- Nom machine : **serveur**
- Pays : France
- Miroir : http://debian.polytech-lille.fr
- Environnement : **MATE**

![Logo Debian redimensionné](https://www.debian.org/logos/openlogo-nd-100.png){width=25%}

> [!TIP]
> Toujours vérifier l'intégrité de l'ISO avec la somme SHA512 avant utilisation.

## Post-installation

### Ajout de l'utilisateur au groupe sudo

```bash
su - root
usermod -aG sudo monlogin
```

### Installation des *Guest Additions*

Montage de l'image VBoxGuestAdditions.iso puis :

```bash
sudo apt update
sudo apt install -y build-essential dkms linux-headers-$(uname -r)
sudo sh ./VBoxLinuxAdditions.run
```

