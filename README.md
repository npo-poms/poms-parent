The POMS ecosystem
==================

This is the poms parent. This is the parent pom of the several projects in the poms ecosystem.

Configuration files and context root
------------------------------------
For every deployable we indicate:
The URL in dev/test and production
The port and application context we suggest for development
The configuration file that is automticly included and we suggest for development.
We often support a setting like this:
env=[prod|test|dev|location] to automaticly switch between several setting which vary between environments predictably.



Functional Tests
----------------
See
npo-functional-tests/trunk/src/test/resources/npo-functional-tests.properties
${user.home}/conf/npo-functional-tests.properties


GUI and Backend RestServices
--------
poms[|-dev|-test].omroep.nl/api[|-dev|-test].poms.omroep.nl
developer's port: 8071, context,  backend rest service on /rs
config files:
${user.home}/conf/media.properties
${user.home}/conf/media-rs.properties

Frontend API
-------------
rs[|-dev|-test].poms.omroep.nl/v1

developer's port: 8070, context: /v1
${user.home}/conf/npo-api.properties

Page publisher API
-------------------
publish[|-dev|-test]..pages.omroep.nl
developer's port: 8069
${user.home}/conf/pages-publish.properties

Publisher API
-------------
developer's port: not relevant (no frontend)
${user.home}/conf/npo-publisher.properties

NPO API Clients
---------------
This project provides java clients for the above projects.


VPRO shared
-----------
Most projects also depend on a collection of utilities maintained by VPRO but which are not specific for POMS or its subsystems

POMS shared
-----------
These modules are specific for POMS, and most noticably contain the domain classes shared by most projects, like the 'domain' objects and services.

Classes from this may also end up outside the POMS projects themselves. Like e.g. CMS's (probably via the api clients)

POMS shared backend
-------------------
Sometimes different POMS project share 'backend' code, like repository implementations. These need never be exposed to the outside world.





Dependencies
------------
<!--- PNG's are created using 'graphviz' from the *.dot files. See Makefile.-->
This describes schematicly the dependencies between the several modules relevant to poms.

This does not intend to be exhaustive, but merely tries to sketch the big picture.

An important aspect is that dependencies may only be one way. Often dependencies are both transitive and direct, of which only examples are indicated.


![dependency graph](raw/master/poms-dependencies.svg?sanitize=true "")

## open source
The artifacts in 'sharable utilities' are or will be available on maven central, which makes them useable also by other parties then [VPRO](https://github.com/vpro)


Deployments
------------
This describes schematicly the connections between actual systems relevant to poms.

This does not intend to be exhaustive, but merely tries to sketch the big picture. Especially the part 'World' contains mainly examples.

![deployment graph](raw/master/poms-deployment.svg?sanitize=true "")
