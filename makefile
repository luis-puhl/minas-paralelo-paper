
# 00.main.pdf: 00.main.tex 01.introducao 02.fundamentos.tex 03.trabalhos-relacionados.tex 04.proposta.tex 06.finais.tex 99.referencias
00.main.pdf: *.tex *.bib
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error 00.main.tex
	bibtex 00.main.tex
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error 00.main.tex
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error 00.main.tex

00.report.pdf: *.tex *.bib
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error 00.report.tex
	bibtex 00.report.tex
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error 00.report.tex
	pdflatex -synctex=1 -interaction=nonstopmode -file-line-error 00.report.tex
