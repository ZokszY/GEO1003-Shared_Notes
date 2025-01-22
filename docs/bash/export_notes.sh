#!/bin/bash

mkdir -p pdf
pandoc --from=markdown+rebase_relative_paths -s -o pdf/notes.pdf --metadata-file=metadata.yaml --number-sections --pdf-engine=pdflatex $(cat notes.txt)

echo "PDF generated successfully!"
