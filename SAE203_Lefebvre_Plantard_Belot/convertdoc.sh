#!/bin/bash

# On récupère le chemin absolu du dossier .local_gems qui se trouve un niveau plus haut (..)
export GEM_HOME="$(pwd)/../.local_gems"

# On ajoute les binaires locaux au PATH pour ce script
export PATH="$GEM_HOME/bin:$PATH"

# Suppression des anciens rendus
rm -f rapport.html
rm -f rapport.pdf

# Génération des nouveaux rendus
#asciidoctor rapport.adoc -o rapport.html
#asciidoctor-pdf rapport.adoc -o rapport.pdf

asciidoctor ../rapport.adoc -o rapport.html
asciidoctor-pdf ../rapport.adoc -o rapport.pdf


echo "Conversion terminée avec succès via l'environnement local !"
