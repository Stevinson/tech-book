# Facade

Facade patterns hide the complexities of the system and provide an interface to the client which the client can access accross the system.

## Example

Given a 'complex system' that consists of an interface `Shape.java` and its children, `Square.java`, `Circle.java` and `Triangle.java`. A facade could take the form of a `ShapeMaker.java` which creates an instance of each of these shaped in its constructor and has methods to draw each of them. A `Demo.java` class can then just call the shape maker, and does not not to interact with the complex system.
