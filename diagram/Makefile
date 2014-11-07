.SUFFIXES:
.PHONEY: _

SOURCE=$(wildcard *.dot)
TARGET=$(SOURCE:.dot=.svg)
BUILD=dot -Kcirco -Tsvg

%.svg : %.dot
	$(BUILD) $< -o $@

_: $(TARGET)

clean:
	rm $(TARGET)
