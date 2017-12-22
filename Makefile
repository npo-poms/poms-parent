

all: poms-dependencies.png poms-deployment.png

%.png: %.dot
	 dot  -Tpng $< -o $@
