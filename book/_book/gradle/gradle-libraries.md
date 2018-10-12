# Libraries


## Gradle API

`getProperties()` gets all the attributes associated with a project.

```
project.findProperty(propertyname)

    task taskname()
```

There is a one-to-one relationship between a Project and a build.gradle file. During a build initialisation, Gradle assembles a **project object** for each project which to participate in the build.


## i2 API

* `ToolkitConstants`

Constants for directory and file names for the topology.

`TopologyApplicationUtils`

* The topology is an xml file and this class contains all the targets used in the topology files so values can be extracted.
