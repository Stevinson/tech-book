# OCA Book

## Chapter 5

### Inheritance

By design, Java doesn't support multiple inheritance in the language because studies have shown that multiple inheritance can lead to complex, often difficult-to-maintain code. Java does allow one exception to the single inheritance rule: classes may implement multiple interfaces, as you'll see later in this chapter.

The first line of every constructor in Java is either `this()` or `super()`, even if these lines are only added by the compiler at compile time.

#### Contructors

In Java, the parent constructors are always called before the children constructors.

#### Inherited Class Members

The `this` keyword can also be used to call a parent's class members. The `super` keyword can also be used to explicitly refer to a parent's class member.

#### Overriding Parent methods

Overriding parent methods has its limitations:

1. The child method must have the same signature.

2. The child method must be at least as accessible as the parent.

3. The child method may not throw a checked exception that is new or broader than the class of any exception that is thrown by the parent method.

4. The return class of the child method must be the same or a subclass of the return type of the parent method. This is known as **covariant return types**.

Note that **overloading** is using the same method name with a different signature, whilst the above is **overloading**.

For non-private methods, both methods must use static or neither.

#### Hidden Method

A **hidden method** occurs when a child class defines a static method with the same name and signature as a static method defined in a parent class. The same four rules defined above for overriding methods still apply, along with the following additional rule:

1. The method defined in the child class as static must be marked as `static` if it is marked as `static` in the parent class. Likewise, the method must not be marked as `static` in the child unless it is marked as `static` in the parent.

However, unlike overridden methods, at runtime the parent version of a hidden method is always executed if the call to the method is defined in the parent class.

### Abstract methods and classes

An abstract class does not need to implement any methods in its parents.

### Interfaces

* public, final and static are assumed when defining a variable in an interfaces
* static methods in interfaces have to have

### Inheriting variables

Java does not allow variables to be overridden, only hidden. However, it is considered extremely bad practice to do so.

### Abstract classes

* A class defined as abstract can never be initialised.

* A method defined as abstract does not (and can not) provide an implementation.

* An abstract method may only be declared in an abstract class.

*





----

All variables in iinterfaces are assumed to be public static final, abstracr classes may contain them as well,

Interfaces do not inherit from Java.Object as then Java would be inheriting from multiple classes.

double is to float what short is to int.

Overriding -> when you have the same method signature

Overloading -> when you have a different method signature
