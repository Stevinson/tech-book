# Gradle

## General

Gradle is a build automation system and a DSL (domain specific language) that is based on Groovy. Gradle uses a directed acyclic graph to determine the order in which tasks are run.

NB. To set up a new gradle project use the command: `gradle init --type java-library`.

When importing a gradle project into IntelliJ, point at the build.gradle file not just the overall directory.

These are the different parts of a build.gradle file:

1. Plug-ins used: The first part of the build file specifies the plug-ins required to build the project and some basic project configuration.

2. buildscript: Where to find plug-ins for download.

3. repositories: Where to find dependencies for download.

4. dependencies: Java dependencies that are required for compiling, testing, and running the application are included here. You can also define your Liberty runtime dependency in this section.

5. ext: Gradle extra properties extension for project level properties.

6. liberty: Configuration for the Liberty plug-in.

7. war: War plug-in configuration.

8. test: Unit test and integration test configuration.



---



## Basics

### Project class

Every Gradle build is made up of one or more *projects*.

All the tasks in a gradle file are methods that belong to a gradle project class. Groovy projects have tasks and properties associated with them.

**ext** is shorthand for project.ext, which is used to define the extra properties associated with the project object.






### Plugins

Gradle is a plug-in based language. Almost all projects will use at least one plug-in.

`apply` is the method name, `plugin` is a property within the class whose value gets assigned to the plugin you want to use.

A **source set** is a group of source files which are compiled and executed together. Inside the `java` plugin there are a bunch of tasks, some of which are common like `compileJava`.

* A **script plugin** is essentially adding another build file into your own build file (note that they are idempotent).

* **Binary plugins** use the syntax `apply plugin: 'java'` that uses the `buildscript` block to tell gradle where the dependency is.

* `plugins.gradle.org` is a repository of Gradle plugins.


### Tasks

* Tasks can be made conditional by two means:

  1. Tasks have an `onlyIf` property which takes a predicate to decide whether the task gets run.
  2. Tasks with inputs and outputs. A hash gets taken of these when a task is run, meaning that the next time it is called they can be checked and then the task is only run of they are different.

* Tasks can be enabled/ disabled by setting their `.enabled` property to true or false.


### build.gradle commands

#### Dependencies

The `dependencies` in build.gradle declares which dependencies the project has.

Dependencies are grouped into **configurations**. A configuration is a named set of dependencies. e.g. you can put all the dependencies for a particular use case together as a configuration.

**Transitive dependencies** mean that if the fetched dependencies have dependencies of their own, then fetch them. However, if you want to fetch only the dependency you have declared then add `ext: 'jar'` to the end of the dependency declaration.

The `compile` keyword states that it will be available throughout the project, whilst the `testCompile` states that it will only be available in the test directories.

There are a bunch of use cases:

* `files` - specify particular jar files
* `fileTree` - use specific directory, with the `include` and `exclude` options allowing specification
* `providedCompile` - means that the dependency is required at compile time but do not need to be packaged with the application as they are provided at run time

#### Repositories

The `repositories` block defines what repositories are being used to fetch the dependencies, e.e. `mavenCentral`

```groovy
repositories {
  flatDir { dirs 'localLib' }

}
```

#### Liberty

The liberty section defines the following:

* name - The server name.

* configFile - The server configuration file.

* bootstrapProperties - Bootstrap properties that are written to the server’s bootstrap.properties file.

* packageLiberty - Specifies to only package the usr directory in the build/GradleSample.zip file.

#### Other

* `sourceCompatability = 1.8`

* `version`

* `jar`

```groovy
jar {
  manifest {
    attributes 'Implementation-Version': version
  }
}
```


* A `ConfigurationContainer` is responsible for declaring and managing configurations. It can be obtained by calling `Project.getConfigurations()` or using the `configurations` property.


## CLI Commands

* `gradle clean` removes the build folder that is created by `gradle build`.

* `open build/reports/tests/index.html` shows the output of build process.


---



## How to create a new gradle project

1. First we create a gradle project: `$ gradle init --type java-library`

2. Then we format it to a Liberty server:

  * Create a web.xml: `touch src/webap/WEB-INF/web.xml`
  * Create a server.xml: `touch src/main/liberty/config.server.xml`

3. Fill the `build.gradle`, this cis comprised of the following sections:

  * apply the plugins required
  * version details, e.g. `version: '1.0-SNAPSHOT'`
  * `buildscript` to state the plugins required
  * `repositories` - where to find the dependencies
  * `dependencies` - the java code required for compilation
  * `ext` - variables
  * `war`
  * `test`



4. Connect to IBM Cloud

  * Create a `manifest.yml` file in the project's root directory. A basic example is as follows:

  ```
  applications:
  3  - name: GetStartedJava
  4    random-route: true
  5    path: target/GetStartedJava.war
  6    memory: 256M
  7    instances: 1
  ```

  * log in
  * `bx target --cf`
  * `bx cf push` from within the root directory


TODO:

* Set up pipeline of testing

* Set up local minikube

* Set up IBM cloud so online

* Add redis to cache db stuff

* Docker images

* kubernetes

* helm

* refactor out front end into microservice


---


## Libraries


### Gradle API

* `getProperties()` gets all the attributes associated with a project.

* The `<<` left shift operator is shorthand for `doLast`. This makes the whole of the task is executable code.

* **ext** is shorthand for project.ext, which is used to define the extra properties associated with the project object. e.g. `ext.person = 'Dolly'`

* `dependsOn` after the task name means that the dependent tasks get run before the task that is called.

* `finalizedBy` is the opposite of `dependsOn` in that

```
project.findProperty(propertyname)

    task taskname()
```

There is a one-to-one relationship between a Project and a build.gradle file. During a build initialisation, Gradle assembles a **project object** for each project which to participate in the build.

* `$buildDir` is an automatically created variable that defaults to the build directory.


### i2 API

* `ToolkitConstants`

Constants for directory and file names for the topology.

`TopologyApplicationUtils`

* The topology is an xml file and this class contains all the targets used in the topology files so values can be extracted.

#### Parsing

```
def topology = SlurperUtils.newXmlSlurper().parse(filePath)
def databaseType = DatabaseTypes.DISCO
def infostore = topology.databases.database.find({ x -> (x.@'database-type.text() == databaseType)})
```

This is used to parse XML files to get configuration settings and topology.



#### File Structure

`InfoStoreIngestionTasks.gradle` is used to do things such as create a staging table. How this works is that it calls the StagingTableCreatorCLI.java with all the correct arguments set.



#### Getting User Arguments

```gradle
def variableName = InfoStoreUtils.getMandatoryPropertyOrLogError('variableName')

def optionalVariablename = InfoStoreUtils.getOptionalProperty(variableName, defaultValue)
```

The above methods ares used to get user arguments from the command line.


#### $ sign in strings

The `$` sign in double-quoted strings is used for string interpolation in gradle.

NB. To escape and use an actual dollar sign then use a `\$`

#### @ sign in strings

The `@` sign followed by single-quoted strings are a means of getting a target value from an xml file.


#### Topology

depdev/dependencies/deploymenttoolkit/examples/configurations/information-store-opal/configuration/environment/topology

deployment/src/infrastructure/resources/opal-daod/configuration/environment/topology

Always put conditional logic in a `doLast{}` statement otherwise it will always be run.



  topology-updater.gradle in Apollo Core Toolkit updates the topology.

  DefaultsGenerator.groovy - generates default paths

  SlurpurUtils xml helpers for groovy

  TopologyGenerator.gr - this is a second machanism for creating the topology in a dynamic manner (as well as the static versions that are just copied)



---


## Other

`pathJar(<jar_name>, fileTree(dir: <path>, includes: [<jar_names>]))`

This is a means of condensing several jars into one.

security template with the xml

ensuresecurecookiesinliberty



deploybasicuserregistry


## Gradle Daemon

The Gradle daemon runs Gradle as a background process, meaning that it quickens further build runs. It is recommended that it is ran on dev boxes but not CI boxes.

To enable/disable it, from the command line:

```bashrc
--daemon
--no-daemon
```

or from <<GRADLE_USER_HOME>>/gradle.properties file with the `org.gradle.daemon=true` property.

## Debugging

Instead of using `println` to print messages for debugging, using `logger.quiet()`, `logger.warn()` or `logger.error()` (7 for each level), means that the task can be run with `-i, --info` to print the extra information.

## Profile

`gradle --profile <task_name>`

This adds a profile folder to the build directory, which contains information about that task such as build time and the configuration.

## Parallel

`gradle --parallel <task_name>`

Runs projects in parallel where possible.
