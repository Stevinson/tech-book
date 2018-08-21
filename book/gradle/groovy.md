# Groovy

NB. To test groovy you can go to groovy/bin/groovyConsole for a groovy editor.

## POGOs

There are several interesting attributes of plain old groovy objects:

* Methods and classes are public by default and properties are private.

* Groovy auto-generates getters and setters for properties - `setVariableName` and `getVariableName`. If you explicitly set a property's access modifier then the getters and setters are not autogened.

* In groovy you get a *map-based constructor* by default. This means that you can set a class's properties without creating a constructor.

* The return key word is not needed and groovy just tries to return the last line

* You get plenty more java libraries imported automatically

## Collections

* You can create a LinkedList by: `def nums = [1, 2, 3] as LinkedList`

* You can create a map: `def map = [a:1, b:2, c:3]` and can use the dot operator to add new key/value pairs.


## Closures

Groovy closures act like anonymous methods that can be passed as a parameter.

The common methods that takes closures are:

* `each()`

* `findAll()`

* `collect()`

## Configuration and Execution Phases

## Other

`def` allows dynamic variables.

## Debug

To debug a groovy file create a new groovy file and use println with a main.

```
static void main(String[] args)
{
    Bob bob = new Bob()
    println bob.discoTopologyWithValidSecureSolrKeyStoreConfig
}
```
