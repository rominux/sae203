#!/bin/bash

rm -f rapport.html
rm -f rapport.pdf

asciidoctor rapport.adoc -o rapport.html
asciidoctor-pdf rapport.adoc -o rapport.pdf
