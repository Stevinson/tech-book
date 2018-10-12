# Libraries


## Gradle API

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


## i2 API

* `ToolkitConstants`

Constants for directory and file names for the topology.

`TopologyApplicationUtils`

* The topology is an xml file and this class contains all the targets used in the topology files so values can be extracted.
