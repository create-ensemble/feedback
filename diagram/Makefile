.SUFFIXES:
.PHONEY: _

SOURCE=$(wildcard *.dot)
TARGET=$(SOURCE:.dot=.svg)
TARGET_PDF=$(SOURCE:.dot=.pdf)
BUILD=dot -Kcirco -Tsvg
BUILD_PDF=dot -Kcirco -Tpdf

%.svg : %.dot
	mkdir -p svg
	$(BUILD) $< -o svg/$@

_: $(TARGET)

pdf: $(TARGET_PDF)

%.pdf : %.dot
	mkdir -p pdf
	$(BUILD_PDF) $< -o pdf/$@

clean:
	rm $(TARGET)
