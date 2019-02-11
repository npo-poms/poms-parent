[![Build Status](https://travis-ci.org/npo-poms/poms-parent.svg?)](https://travis-ci.org/npo-poms/poms-parent)
[![Maven Central](https://img.shields.io/maven-central/v/nl.vpro.poms/poms-parent.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22nl.vpro.poms%22%20AND%20a:%22poms-parent%22)

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

An important aspect is that dependencies may only be one way and non circular. Often dependencies are both transitive and direct, of which only examples are indicated.


<img src="https://rawgit.com/npo-poms/poms-parent/master/poms-dependencies.svg" />

### open source
The artifacts in 'sharable utilities' are or will be available on maven central, which makes them useable also by other parties then [VPRO](https://github.com/vpro)


# Operations and development

## Configuration files and context root
For every deployable we indicate:
The URL in dev/test and production
The port and application context we suggest for development. Configure your application like this and you would have minimal configuration to do to get things up and running on your development machine.

The configuration file that is automaticly included and we suggest for development. We suggest that you maintain configuration you need for development in this file. 

We often support a setting like this:
env=[prod|test|dev|location] to automaticly switch between several setting which vary between environments predictably.


| project | url |  configuration file | recommended port and context during development |
| ------- | ----| -------------- | ------------- | 
| [Functional Tests](https://github.com/npo-poms/functional-tests)| | `${user.home}/conf/npo-functional-tests.properties` | - |  
| [GUI](https://subversion.vpro.nl/repo/nl/vpro/media/trunk/)  | [https://poms[\|-dev\|-test].omroep.nl/](https://poms.omroep.nl/) | `${user.home}/conf/media.properties` | [8071](http://localhost:8071/) |
| [Backend](https://subversion.vpro.nl/repo/nl/vpro/media/trunk/media-rs/)  | [https://api[\|-dev\|-test].poms.omroep.nl/](https://api.poms.omroep.nl) | `${user.home}/conf/media-rs.properties` | [8071/rs](http://localhost:8071/rs) |
| [Frontend API](https://subversion.vpro.nl/repo/nl/vpro/api/trunk/)| [https://rs[\|-dev\|-test].poms.omroep.nl/v1](https://rs.poms.omroep.nl/v1) | `${user.home}/conf/npo-api.properties` | [8070/v1](http://localhost:8071/v1) |
| [Page publisher API](https://subversion.vpro.nl/repo/nl/vpro/pages-publish/trunk/)| [https://publish[\|-dev\|-test].pages.omroep.nl/v1](https://publish.pages.omroep.nl) | `${user.home}/conf/page-publish.properties` | [8069](http://localhost:8069) |
| [Publisher](https://subversion.vpro.nl/repo/nl/publiekeomroep/npo-publish/trunk/) | - | `${user.home}/conf/npo-publisher.properties` | - |
| [Images Frontend](https://subversion.vpro.nl/repo/nl/vpro/images/trunk/image-server-frontend/) | [https://images[\|-dev\|-test].poms.omroep.nl/](https://images.poms.omroep.nl) | `${user.home}/conf/images-frontend.properties` | 8072 |
| [Images Backend](https://subversion.vpro.nl/repo/nl/vpro/images/trunk/image-server/) | [https://poms[\|-dev\|-test].omroep.nl/images](https://poms.omroep.nl/images) | `${user.home}/conf/images.properties` | [8071/images](http://localhost:8071/images/)  |

### Functional Tests
See https://github.com/npo-poms/functional-tests
 

### GUI and Backend RestServices
Currently the POMS GUI and the POMS Backend API are maintained as one project with two artifacts, which are also always deployed in one tomcat.  It would actually be a good idea to deploy the backend API seperately and also redundant. We may do this on the new hosting solution.

We may also split up the project in SCM then.

### Frontend API

### Page publisher API

### Publisher API

### NPO API Clients
This project provides java clients for the above projects.

### VPRO shared
Most projects also depend on a collection of utilities maintained by VPRO but which are not specific for POMS or its subsystems. 

### POMS shared
These modules are specific for POMS, and most noticably contain the domain classes shared by most projects, like the 'domain' objects and services.
See https://github.com/npo-poms/poms-shared

Classes from this may also end up outside the POMS projects themselves. Like e.g. CMS's (probably via the api clients)

### POMS shared backend
Sometimes different POMS project share 'backend' code, like repository implementations. These need never be exposed to the outside world.


