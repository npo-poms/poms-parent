

all: poms-dependencies.png poms-deployment.png poms-dependencies.svg poms-deployment.svg README.html

%.png: %.dot
	 dot  -Tpng $< -o $@

%.svg: %.dot Makefile
	 dot  -Tsvg $< -o $@

# sudo gem install asciidoctor
%.html: %.adoc
	asciidoctor $<
