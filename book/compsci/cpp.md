# C++

This page describes the differences between Java and C++.

## Data Types

Data types in C++ are machine dependent.

## Variables

The C++ compiler does not check whether variables are initialised before they are read. This means the value of the variable will be the random bit pattern that happened to be in the memory location that the local variable occupies.

---

## Pointers and References

* This means that a reference can only ever be assigned and not reassigned because assignment to a reference variable means assignment to the original object that it refers to.

* A pointer can be assigned the address of a different target and it can be assigned a `nullptr`. Since a pointer is a variable it has an address of its own.

* When a reference's value is obtained, dereferencing is performed automatically by the the compiler and we receive the target's value immediately. To obtain its address we must use `&ref`.

* When a pointer's value is obtained, we receive the address of its target. To obtain the value of the target of a pointer we must use `*ptr`.

---

## Pass by References

To stop unwanted modification of a value that is passed by reference, us the `const` keyword.

## Smart Pointers

* **unique**

* **shared**

* **weak**

## Iterator

## Copy constructor

## Move Constructor

## Destructor

A destructor has the same name as the class but with a `~` before the name. It is called when the object goes out of scope or when the `delete` is called.
