DOCUMENT=graphalytics_spec.tex

all: $(DOCUMENT)
	latexmk -pdf --interaction=batchmode $(DOCUMENT)

query_cards: $(DOCUMENT)
	cd standalone-query-cards && \
	for card in *.tex; do \
		../texfot.pl latexmk -pdf --interaction=batchmode $$card ; \
	done

texfot: $(DOCUMENT)
	./texfot.pl latexmk -pdf --interaction=batchmode $(DOCUMENT)

clean:
	rm -f *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg *.fdb_latexmk
	cd standalone-query-cards && rm -rf *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg *.fdb_latexmk
