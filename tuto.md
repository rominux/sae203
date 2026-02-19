# Semaine S08 – Balisage léger

Nous avons choisi **Markdown + Pandoc** pour rédiger ce rapport.

## Variété des techniques utilisées (exigences S10)

- Titres de différents niveaux
- **gras**, *italique*, `code en ligne`
- Listes numérotées et à puces avec sous-listes
- Tableau (voir ci-dessus)
- Note de bas de page[^noteex]
- Lien externe : [Documentation Pandoc](https://pandoc.org/MANUAL.html)
- Lien interne : [voir post-installation](#post-installation)
- Image redimensionnée (voir logo Debian ci-dessus)
- Bloc de code bash
- Admonitions (note, tip, important, warning...)

[^noteex]: Exemple de note de bas de page obligatoire dans le rapport intermédiaire.

> [!WARNING]
> Il est **interdit** d'écrire du HTML brut dans le fichier source Markdown.

# Conclusion et perspectives

Ce rapport intermédiaire montre la bonne progression du projet.  
Prochaines étapes :

- Étude des applications clientes (S10)
- Installation et utilisation de **Forgejo** (S11)
- Personnalisation avancée du rendu (CSS, multi-fichiers, TOC auto) pour S13

---
### 2. Fichier tutoriel de conversion → `tuto-conversion.md`
# Procédure de conversion du rapport (readme.md)

## Membres de l'équipe

- Lefebvre Romain
- Plantard Kylian
- Belot Emilien

## Outils nécessaires

| Outil     | Utilité                              | Site officiel                              | Installation typique (Debian/Ubuntu)     |
|-----------|--------------------------------------|--------------------------------------------|------------------------------------------|
| pandoc    | Conversion Markdown → HTML / PDF     | https://pandoc.org                         | `sudo apt install pandoc`                |
| texlive   | Moteur PDF (via LaTeX)               | https://www.tug.org/texlive/               | `sudo apt install texlive-latex-base ...`|
| weasyprint| Alternative moderne pour PDF (CSS)   | https://weasyprint.org                     | `pip install weasyprint`                 |

> **Recommandation** : pour un PDF de qualité avec bon support des admonitions et CSS, privilégier **WeasyPrint** ou **Prince** si disponible.

## Commandes de conversion

### Prérequis (Debian 13 dans la VM)

```bash
sudo apt update
sudo apt install pandoc texlive-latex-base texlive-fonts-recommended \
                 texlive-latex-extra texlive-lang-french fonts-liberation
# Optionnel mais recommandé pour un meilleur PDF :
sudo apt install texlive-xetex
```

### Générer le HTML (standalone)

```bash
pandoc rapport.md -o rapport.html \
  --standalone \
  --toc \
  --number-sections \
  --css=style.css           # optionnel – voir ci-dessous
```

### Générer le PDF (via LaTeX – méthode classique)

```bash
pandoc rapport.md -o rapport.pdf \
  --pdf-engine=pdflatex \
  --toc \
  --number-sections \
  -V geometry:margin=2.5cm \
  -V lang=fr-FR
```

### Générer le PDF avec WeasyPrint (meilleur rendu CSS – recommandé)

```bash
pandoc rapport.md -o rapport.html --standalone --self-contained
weasyprint rapport.html rapport.pdf
```

Ou en une seule ligne (Pandoc 3.1+ avec weasyprint installé) :

```bash
pandoc rapport.md -o rapport.pdf \
  --pdf-engine=weasyprint \
  --css=style.css \
  --toc
```
