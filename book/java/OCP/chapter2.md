# Chapter 2 - Design Patterns and Principles

## Interface

* Interface method definitions can be duplicated in a child interface without issue.

## Functional Programming

### Functional Interface

* A **functional interface** is an interface with only one abstract method and are used for the basis for lambda expressions. The presence of other default or static methods does not effect this definition.

* Whilst Java will assume that any interface with only one abstract method is a functional interface, the `@FunctionalInterface` annotation can be used to make this explicit.

* Note that an interface with no methods but that extends one that has one or an interface that overrides another interface that has only method are both functional interface as they both effectively have only method.

* Java relies on context when figuring out what lambda expressions mean. If you provide a lambda as an argument of a method then Java will treat the parameter as a functional interface and map the lambda to the single abstract method.

* martin fowler
