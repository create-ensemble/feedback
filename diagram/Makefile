.SUFFIXES:
.PHONEY: _

SOURCE=$(wildcard *.dot)
TARGET=$(SOURCE:.dot=.svg)
BUILD=dot -Kcirco -Tsvg

%.svg : %.dot
	mkdir -p svg
	$(BUILD) $< -o svg/$@

_: $(TARGET)

clean:
	rm $(TARGET)
