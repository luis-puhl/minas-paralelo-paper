
all: lifecycle-uml-svg.pdf mfog-arch-fisica.svg.pdf

# inkscape -D $? -o $@ --export-latex
%-svg.pdf: %.svg
	rsvg-convert -f pdf -o $@ $?

%-uml.svg: %.puml
	plantuml -tsvg -pipe < $? > $@
