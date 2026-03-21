#!/bin/bash

# Vérification des dépendances
if ! command -v asciidoctor &> /dev/null || ! command -v asciidoctor-pdf &> /dev/null; then
  echo "Erreur : asciidoctor ou asciidoctor-pdf n'est pas installé."
  echo "Installez-les avec : gem install --user-install asciidoctor asciidoctor-pdf rouge"
  exit 1
fi

echo "Suppression des anciens rendus..."
rm -f *.html *.pdf

echo "Génération du Tutoriel..."
asciidoctor tutoriel.adoc -o SAE203_Tutoriel.html
asciidoctor-pdf -a pdf-theme=css/mon-theme.yml tutoriel.adoc -o SAE203_Tutoriel.pdf

echo "Génération de la FAQ..."
asciidoctor faq.adoc -o SAE203_FAQ.html
asciidoctor-pdf -a pdf-theme=css/mon-theme.yml faq.adoc -o SAE203_FAQ.pdf




echo "Conversion terminée avec succès ! Vos fichiers finaux sont prêts."
