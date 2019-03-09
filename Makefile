.PHONY: downloads

downloads:
	gitbook epub ./ ./downloads/byte-of-python.epub
	gitbook pdf ./ ./downloads/byte-of-python.pdf
	gitbook mobi ./ ./downloads/byte-of-python.mobi
