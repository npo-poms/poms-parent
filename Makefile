

all: poms-dependencies.png poms-deployment.png poms-dependencies.svg poms-deployment.svg index.html

%.png: %.dot
	 dot  -Tpng $< -o $@

%.svg: %.dot Makefile
	 dot  -Tsvg $< -o $@

# sudo gem install asciidoctor

index.html: README.adoc Makefile
	asciidoctor $< -o $@ --attribute=htmled=true

%.html: %.adoc
	asciidoctor $<
