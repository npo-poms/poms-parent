

all: poms-dependencies.png poms-deployment.png poms-dependencies.svg poms-deployment.svg

%.png: %.dot
	 dot  -Tpng $< -o $@

%.svg: %.dot Makefile
	 dot  -Tsvg $< -o $@
