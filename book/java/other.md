# Other

## JDK

To find out which java you are using:

`which java`

To find out where the jdk is saved on a mac, enter the following command:

`/usr/libexec/java_home`

To set JAVA_HOME follow the instruction at http://www.sajeconsultants.com/how-to-set-java_home-on-mac-os-x/.





## `final` keyword

### Effectively final variables

From Java 8, variables that are never changed having been initialised are called effectively final. Local classes can access the *final* or *effectively final* variables of the encompassing class.

### Final classes

When a class is defined as final in Java, it merely means that it cannot be extended. One may want to enforce this due to the unpredictable behaviour of classes that implement inheritance. Due to this classes should either be designed to be extended (and have all the relevant documentation) or be declared final.

### Final Methods

When a method is declared as final in Java it means that can't be overridden (for object scope) or hidden (for static). This allows a developer to create functionality that cannot be changed by subclasses, hence guaranteeing the functionality. By not allowing customisation you can


---


## Operators

### Arithmatic Operators

1. If an arithmatic operator is applied to two different types, the smaller type is promoted to the larger type.
2. Java binary arithmatic operators cause types smaller than an `int` to be promoted to an `int` (except for **unary** operations).

**Pre-increment** and **post-increment** operators differ in that they return the new-value or the old-value of the operation. Note that this can mean that they can return different results if used in specific ways.


---


## Flow

### `continue` Keyword

The `continue` keyword escapes the current iteration - i.e. to the boolean logic. `if` and `switch` statements do not react to `continue`.

### Break Keyword

This is different from `break`, which transfers control to the enclosing statement. `if` statements do not react to `break`.


---


## Optional Labels

These allow higher scoped loops to escaped.

### Reflection

Reflection is code that is able to inspect other code in the same system. A common usage of this in statically typed languages is calling a method on an object if that method exists:

```
Method method = foo.getClass().getMethod("doSomething", null);
method.invoke(foo, null);
```


---


## XML

* **JAXB** is used for binding XML schemas and JAVA representations, allowing XML to be used in JAVA applications.

Marshalling

1. Map the schema of the XML file

2. Unmarshall the XML

3. Modify the XML object in memory

4. Marshall the modified object wherever

   ​
---


## Error Handling

### Executors

`log4j` is a Java based logging utility. It has multiple layers of logs - trace, debug, info, warning, error and fatal.


---


### Types

* Floating point literals are assumed to be of type **double** unless they are post-fixed with `f`.

* To create a list use the following:

  `final List<String> columnValues = Lists.newArrayList()`


###### Literals

A **Literal** is the source code representation of a fixed value; literals are represented directly in your code without requiring computation.

For example a `boolean` is a data type, whilst `true` is a literal.



## APIs

* `java.long.Iterable` holds most of the Java `Collections` framework. For the OCA exam we only need to know `List` and `ArrayList`.

* `Array`. Arrays are declared with the following syntax: `String[] names = String[3]` (this creates an empty array of size 3), whilst `String[] names = {1, 2, 3}` is used to instantiate.

  ​

## To Look Up Further

1. Literals
2. Difference between `enum` values and `enum` constants.

### Interfaces

You don't need to add the *public* keyword to methods defines in the interface as they are public by default.


---


## Lambdas

* Lambda is a Java specific term. The more generic name for them are closures.

* A limitation of things that you pass into lambda's is that they have to be `final` or effectively final.

TODO


---


## Spring

Spring is built to implement a dependency injection approach. It is just another alternative to Guice.

### Annotations

#### Autowiring

Autowiring allows you to skip configurations wlsewhere of what to inject and just does it for you.

### D


---


## Abstract keyword

### Abstract Classes

Abstract classes cannot be instantiated, but rather define methods for subclasses that can be instantiated.


---

## Private constructors

### Uninstantiable classes

Private constructors can be used to create uninstantiable classes that are just a collection of related static functions.

### Readability

When a class has several different constructors then a private constructor can be used to make it easier to understand the different ways of constructing the class.

### Delegating constructors

**Delegating constructors** use private constructors to take a lot of options (which are implementation details) and then uses other constructors to delegate to it.


Private constructors can also be used when the constructor should only be used in a certain constructor. Another method can call the constructor, but this adds a level of


---


## Utility classes

A utility class is one that only has static methods.

1. You should make the class final.

2. You should not make it public.

3. It should have a private constructor, so that it cannot be extended.


---

## Concurrency

The Java platform is designed from the ground up to support concurrent programming. In concurrent programming there are two basic units of execution: **processes** and **threads**.

https://docs.oracle.com/javase/tutorial/essential/concurrency/procthread.html TODO: Finish reading this article


---


## Varargs

The varargs parameter ()e.g. `int... variableName`) gives the ability to treat the parameter as if it was an array. Meaning that you can just pass the method a comma separated list of parameters and they will be taken as an array by the method.

It must be the last element in the method's parameter list, i.e. you can only have one per method.


---


## Mockito

Mockito is a tool used to create and manage mock objects, that can be used in conjuncture with JUnit.


### Initialised

`MockitoAnnotations.initMocks(this)`

Used in the setUp() method to initialise objects with Mockito annotations.

### Assertions

* `verifyNoMoreInteractions()`

This checks that the mocks given to the method do not have any unverified interaction. It is used after you have verified your mocks to make sure that nothing else hwas invoked on your mocks.


---

## Terminology

A **member** is just a variable or a method.



---

## Static

### Initialisation

The `static` keyword, when used on its own with a set of curly parentheses is used for statin initialisation. This runs the code in the braces when the class is first used. The statements in it run and assign any static variables as needed. These should never be used - just use constructors instead.

### Static Imports

e.g. `import static java.util.Arrays.asList;`

They are used for importing static members of classes. This just saves one having to specify the whole path whenever it is used in a class.



---

## JavaBean

A JavaBean is a class that is:

1. Serialisable

2. No-parameter constructor

3. Uses getters and setters. Note that there are strict naming conventions for getters and setters, namely they must start with `get`, `set` or `is`.

---



## Comparable

```
public interface Comparable<T>
```

This interface imposes a total ordering on all the objects that implement it, referred to their natural ordering. It facilitates the use of the `Collections.sort()` method.




---


## Generics

Generics add stability to your code bt making more of your bugs detectable at compile time.

Generics enable types to be parameters whem defining classes, interfaces and methods.

The benefits of generics are as follows:

* Elimination of casts.

* Stronger type checks at compile time.

* Enable generic algorithms that can work with different types.



---


## Indirection

Indirection is the ability to reference something using a name instead of the value instead.


---


# General Java topics

## Default Keyword

This is a means of making stream strict interfaces so that methods that could be dangerous, such as locking or tidying up, are hidden.

### Default as an access modifier

Note that there is a default access modifier. This is called by omitting an access modifier, not by using the default keyword. It means that the method it is implemented on can only be called from classes in the same package.


---


### Adding methods to interfaces

Default methods enable you to add new functionality to the interfaces of your libraries and ensure binary compatibility with code written for older versions of those interfaces. This is because with the `default` keyword you add a default implementation for the method so that all classes that inherit from it have an implementation.


---



## Virtual Methods

All methods in Java are virtual by default. This means that they can be overridden when used in inheritance, unless that methods is declared final or static.

Generally, a virtual method is one that is inheritable and overridable. It is an important part of polymorphism. A virtual function defines a target function to be executed, but the target might not be known at compile time.

Virtual functions are resolved 'late'. If the function in question is 'virtual' in the base class, the most-derived class's implementation of the function is called according to the actual type of the object referred to, regardless of the declared type of the pointer or reference. If it is not 'virtual', the method is resolved 'early' and the function called is selected according to the declared type of the pointer or reference.

A **pure virtual function** is one that is required to be implemented by a derived class. Classes containing pure virtual functions are termed **abstract** and cannot be instantiated directly.


---

## Optional Specifiers

Optional specifiers go after the access modifier in a method declaration.

### `synchronised`

This keyword is related to different threads reading and writing to the same variables, objects and resources. It enables a strategy for preventing thread interference and memory consistency errors. If an object is visible to more than one thread then all reads and writes to that object's variables are done through synchronised methods, i.e. that these different threads have access to the resource in an **atomic way**.   

### `native`

Used when interacting with code written in other languages such as C++.

### `Strictfp`

---



TODO: Anonymous inner classes

TOREAD:

*

---


In a distributed computing environment, distributed object communication realizes communication between distributed objects. The main role is to allow objects to access data and invoke methods on remote objects (objects residing in non-local memory space). Invoking a method on a remote object is known as remote method invocation (RMI) or remote invocation, and is the object-oriented programming analog of a remote procedure call (RPC).


---

## Environment Variables

In Java `System.getEnv()` is used to retrieve environment variables.


---


## Anonymous subclass instantiation

You can instantiate an anonymous abstract sublass with the following code:

```Java
abstract class My {
    public void myMethod() {
        System.out.print("Abstract");
    }
}

class Poly extends My {
    public static void main(String a[]) {
        My m = new My() {};
        m.myMethod();
    }
}
```


---


## DAO Design Pattern

The **data access object (DAO)** allows the isolation of the application layer from the persistence layer. This hides all the complexities of performing CRUD operations from the application layer.

An example is having an application that works with users, with name and email properties.


## Volatile

The **volatile** keyword is used to indicate that a variable's value will be modified by different threads. as a result the value of the variable will never be cached thread-locally, but rather go straight to main memory. Also, access to the variable acts as though it is enclosed in a **synchronised block**.


---

## Garbage Collections

There are two types of garbage collection:

1. Stop the World

Within stop the world there are two states:

2. Concurrent

This incrementally asks if things are still being used. it takes longer epr event but doesn't stop the world.
