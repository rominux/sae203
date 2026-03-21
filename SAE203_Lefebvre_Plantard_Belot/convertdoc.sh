#!/bin/bash

# Vérification des dépendances
if ! command -v asciidoctor &> /dev/null || ! command -v asciidoctor-pdf &> /dev/null; then
  echo "Erreur : asciidoctor ou asciidoctor-pdf n'est pas installé."
  echo "Installez-les avec : gem install --user-install asciidoctor asciidoctor-pdf rouge"
  exit 1
fi

echo "Suppression des anciens rendus..."
rm -f rapport.html rapport.pdf rapport_qr.html rapport_qr.pdf

echo "Génération du Rapport Principal (Tutoriel)..."
asciidoctor rapport.adoc -o rapport.html
asciidoctor-pdf -a pdf-theme=mon-theme.yml rapport.adoc -o rapport.pdf

echo "Génération du Rapport Secondaire (Questions/Réponses)..."
asciidoctor rapport_qr.adoc -o rapport_qr.html
asciidoctor-pdf -a pdf-theme=mon-theme.yml rapport_qr.adoc -o rapport_qr.pdf

echo "Conversion terminée avec succès ! Vous avez maintenant 4 fichiers (2 HTML, 2 PDF)."