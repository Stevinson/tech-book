# General

Gradle is a build automation system and a DSL (domain specific language) that is based on Groovy. Gradle uses a directed acyclic graph to determine the order in which tasks are run.

## Basics

### Project class

Every Gradle build is made up of one or more *projects*.

All the tasks in a gradle file are methods that belong to a gradle project class. Groovy projects have tasks and properties associated with them.

**ext** is shorthand for project.ext, which is used to define the extra properties associated with the project object.

### Tasks

### POGOs

There are several interesting attributes of plain old groovy objects:

* Methods and classes are public by default and properties are private.

* Groovy auto-generates getters and setters for properties - `setVariableName` and `getVariableName`. If you explicitly set a property's access modifier then the getters and setters are not autogened.

* In groovy you get a *map-based constructor* by default. This means that you can set a class's properties without creating a constructor.

* The return key word is not needed and groovy just tries to return the last line

* You get plenty more java libraries imported automatically

### Collections

* You can create a LinkedList by: `def nums = [1, 2, 3] as LinkedList`


### Closures

Groovy closures act like anonymous methods that can be passed as a parameter.

The common methods that takes closures are:

* `each()`

* `findAll()`

* `collect()`

### Configuration and Execution Phases

### Other

`def` allows dynamic variables.
