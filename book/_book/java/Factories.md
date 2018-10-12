# Factories

The **factory method** is one of the twenty-three Gang of Four design patterns.

## The problem they solve

* How can an object be created so that subclasses can redefine which class to instantiate?

## How they achieve this

* Define the factory method, which is a separate operation for creating an object.

* Create an object by calling a factory method.

This enables the writing of subclasses to change the way an object is created.



---

It helps with the **interface segregation principle** and **dependency inversion principle** of the SOLID best practices.

Other benefits include:

* Easier to implement inversion of control.

* More testable as you can mock interfaces.

* **A lot easier to change the application after shipping, as you can create new implementations without changing the dependent code**.
