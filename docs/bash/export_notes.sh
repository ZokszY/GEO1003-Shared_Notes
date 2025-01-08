#!/bin/bash

mkdir -p pdf
# pandoc --from=markdown+rebase_relative_paths -s -o pdf/notes.pdf --metadata-file=metadata.yaml --pdf-engine=pdflatex $(cat notes.txt)
pandoc --from=markdown+rebase_relative_paths -s -o pdf/notes.pdf --metadata-file=metadata.yaml --pdf-engine=xelatex $(cat notes.txt)

echo "PDF generated successfully!"
