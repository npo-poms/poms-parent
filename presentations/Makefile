
.bundle/gems: Gemfile
	 bundle config --local path .bundle/gems
	 bundle install


#%.html: %.adoc .bundle/gems Makefile
#	bundle exec asciidoctor-revealjs -a revealjsdir=https://cdn.jsdelivr.net/npm/reveal.js@4.5.0  $<

POMS.html: POMS.adoc Makefile  ## Convert index.html from asciidoc
	asciidoctor $< -o $@ --attribute=htmled=true
