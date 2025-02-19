.PHONY: presentations

all: poms-dependencies.png poms-deployment.png poms-dependencies.svg poms-deployment.svg index.html presentations ## Create all images and html


help:     ## Show this help.
	@sed -n 's/^##//p' $(MAKEFILE_LIST)
	@grep -E '^[/%a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'



%.png: %.dot ## Create a png from a graphviz dot vile
	 dot  -Tpng $< -o $@

%.svg: %.dot Makefile
	 dot  -Tsvg $< -o $@

# sudo gem install asciidoctor

index.html: README.adoc Makefile  ## Convert index.html from asciidoc
	asciidoctor $< -o $@ --attribute=htmled=true

presentations:  ## Presentations
	(cd presentations ; make POMS.html)

%.html: %.adoc
	asciidoctor $<
