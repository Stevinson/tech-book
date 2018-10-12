# Chapter 1: Advanced Class Design

Overloading and overriding occur when the method names are the same but overriding occurs when the parameter lists are the same, whilst overloading occurs when the parameter list is different.

* **Virtual method invocation** is when Java looks at the actual type of an object at runtime to decide what method gets called.

* The `@Override` annotation is used to explicitly mark a method as overridden, so that you notice if instead you are accidentally merely overloading the method.

* The `hashcode()` method must:
  1. Have the same result within the same program.
  1. If `equals()` returns true for two objects, then `hashcode()` must return the same result when called on either.
  1. However, if `equals()` returns false, calling `hashcode()` does not necessarily have to return false.
  1. Not use more variables than `equals()`.

* It is common to multiply by a prime number when combining multiple fields in the hash code. This makes the hash code more unique, which helps when distributing objects into buckets.

* **Type safety** means that a program cannot perform an operation on an object unless that operation is valid for that object. It is the most essential element of Java's security. Java enforces type safety as follows: every Java object is stored in some region of the computer's memory and labels every object by putting a class tag next to the object. **Dynamic type checking** is when you check the class tag of an object upon every operation that calls the object, however, this is extremely inefficient. Instead, Java uses **static Type checking**, which looks at the program before it is run and carefully tries to determine which way the tag checking operations will come out, and does not run checking operations more than once where possible.

* Enums enforce type checking, i.e. unlike numeric constants, you cannot get a runtime exception due to an invalid value.
  1. They provide a `values()` method that returns an array of all the values.

* A nested class that is not declared static is called an **inner class**. There are four types of nested class:
  1. A **member inner class** is a class defined at the same level as instance variables and is not static.
    * These cannot declare static fields or methods.
    * They can access members of the outer class, including private members.
  1. A **local inner class** is declared within a method.
  1. An **anonymous inner class** is a special case of local inner class that has no name.
  1. A **static nested class** is a static class that is defined at the same level as static variables.

  Inner classes can be useful as they can encapsulate helper classes by restricting them to the containing class and by making the code easier to read.
