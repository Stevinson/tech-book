# General

Gradle is a build automation system and a DSL (domain specific language) that is based on Groovy. Gradle uses a directed acyclic graph to determine the order in which tasks are run.

## Topics

### Project class

All the tasks in a gradle file are methods that belong to a gradle project class. Groovy projects have tasks and properties associated with them.

**ext** is shorthand for project.ext, which is used to define the extra properties associated with the project object.

### Closures

Groovy closures act like anonymous methods that can be passed as a parameter.
