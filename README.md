# The POMS ecosystem

This is the poms parent. This is the parent pom of the several projects in the poms ecosystem. We use the `pom.xml` of this project to synchronize versions of dependencies.

This README serves as a general description of the different systems that this envolves


## Deployments
This describes schematicly the connections between actual systems relevant to poms.

This does not intend to be exhaustive, but merely tries to sketch the big picture. Especially the part 'World' contains mainly examples.

<img src="https://rawgit.com/npo-poms/poms-parent/master/poms-deployment.svg" />



## Dependencies
<!--- PNG's are created using 'graphviz' from the *.dot files. See Makefile.-->
This describes schematicly the dependencies between the several modules relevant to poms.

This does not intend to be exhaustive, but merely tries to sketch the big picture.

An important aspect is that dependencies may only be one way. Often dependencies are both transitive and direct, of which only examples are indicated.


<img src="https://rawgit.com/npo-poms/poms-parent/master/poms-dependencies.svg" />

### open source
The artifacts in 'sharable utilities' are or will be available on maven central, which makes them useable also by other parties then [VPRO](https://github.com/vpro)


# Operations and development

## Configuration files and context root
For every deployable we indicate:
The URL in dev/test and production
The port and application context we suggest for development
The configuration file that is automticly included and we suggest for development.
We often support a setting like this:
env=[prod|test|dev|location] to automaticly switch between several setting which vary between environments predictably.


| project | url |  configuration file | port  (context) |
| ------- | ----| -------------- | ------------- | 
| Functional Tests| | ${user.home}/conf/npo-functional-tests.properties | - |  
| GUI  | poms[\|-dev\|-test].omroep.nl/ | ${user.home}/conf/media.properties | 8071 |
| Backend  | api[\|-dev\|-test].omroep.nl/ | ${user.home}/conf/media-rs.properties | 8071/rs |
| Frontend API| rs[\|-dev\|-test].omroep.nl/v1 | ${user.home}/conf/npo-api.properties | 8070/v1 |
| Page publisher API| publish[\|-dev\|-test].pages.omroep.nl/v1 | ${user.home}/conf/page-publish.properties | 8069 |
| Publisher | - | ${user.home}/conf/npo-publisher.properties | - |

### Functional Tests
See https://github.com/npo-poms/functional-tests
 

### GUI and Backend RestServices
Currently the POMS GUI and the POMS Backend API are always deployed in one tomcat. 

### Frontend API

### Page publisher API

### Publisher API

### NPO API Clients
This project provides java clients for the above projects.

### VPRO shared
Most projects also depend on a collection of utilities maintained by VPRO but which are not specific for POMS or its subsystems. 

### POMS shared
These modules are specific for POMS, and most noticably contain the domain classes shared by most projects, like the 'domain' objects and services.

Classes from this may also end up outside the POMS projects themselves. Like e.g. CMS's (probably via the api clients)

### POMS shared backend
Sometimes different POMS project share 'backend' code, like repository implementations. These need never be exposed to the outside world.


