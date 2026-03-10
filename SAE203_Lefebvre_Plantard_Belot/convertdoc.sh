#!/bin/bash

if ! command -v asciidoctor &> /dev/null; then
  echo "Erreur : asciidoctor n'est pas installé."
  echo "Vous pouvez installer les dépendances avec la commande : gem install asciidoctor asciidoctor-pdf rouge"
  echo "Ou sur les ordinateurs de l'IUT : gem install --user-install asciidoctor asciidoctor-pdf rouge"
  exit 1
fi
if ! command -v asciidoctor-pdf &> /dev/null; then
  echo "Erreur : asciidoctor-pdf n'est pas installé."
  echo "Vous pouvez installer les dépendances avec la commande : gem install asciidoctor asciidoctor-pdf rouge"
  echo "Ou sur les ordinateurs de l'IUT : gem install --user-install asciidoctor asciidoctor-pdf rouge"
  exit 1
fi

# Suppression des anciens rendus
rm -f rapport.html
rm -f rapport.pdf

# Génération des nouveaux rendus
asciidoctor rapport.adoc -o rapport.html
asciidoctor-pdf rapport.adoc -o rapport.pdf

echo "Conversion terminée avec succès via l'environnement local !"
