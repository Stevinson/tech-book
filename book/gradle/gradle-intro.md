# General

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



### Tasks

* Tasks have an `onlyIf` property which takes a predicate to decide whether the task gets run.

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



## CLI Commands

* `gradle clean` removes the build folder that is created by `gradle build`.

* `open build/reports/tests/index.html` shows the output of build process.
