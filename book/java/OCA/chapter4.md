# OCA Exam Notes

## Chapter 4

### Final variables

When a variable is declared final it must be initialised or will lead to a compile error.

### Protected access modifier

Protected access allows everything that default (package private) access allows and more.


### Constructors

#### Default Constructor

Every class in Java has a constructor whether you code one or not. If you don't include any constructors in the class, Java will create one for you without any parameters. This Java-created constructor is called the default constructor. It is only in the compiled file with the.class extension that it makes an appearance.

#### this()

Constructors can be called only by writing new before the name of the constructor. To call another constructor of the same class use `this`.

When this is used as if it were a method, Java calls another constructor on the same instance of the class.

If you choose to call it, the this() call must be the first non-commented statement in the constructor.



### Passing by reference and by value

* Java is always pass-by-value. Unfortunately, they decided to call the location of an object a "reference".

* Every variable in java is a **reference**, meaning that if you assign `s2 = s1` then when you change `s1` then `s2` will also change. However, this is not true of primitives, which will change. This is because primitives are not references, but rather their bitwise value.

* They are both **assign by value**, it's just that the value of the reference and not the value of the object.

* When a parameter is **passed by reference**, the caller and the callee use the same variable for the parameter. If the callee modifies the parameter varuable, the effect is visible to the caller's variable. Pass by value means that the caller and callee have two independent variables with the same value. If the callee modifies the parameter variable, the effect is not visible to the caller. How Java makes this confusing is that it emulates call-by-reference in a call-by-value environment by allowing modifications to the original object be visible to the caller, but the modifications are only to the object and not to the variable. The example given to show this is found (here)[https://stackoverflow.com/questions/40480/is-java-pass-by-reference-or-pass-by-value#40523].


### Order of initialisation

1. Initialise the superclass

2. Static variable declarations and static initialisers in the order they appear in the file

3. Instance variable declarations and instance initialisers in the order they appear in the file

4. The constructor



### Encapsulation

Encapsulation means something specific in Java. Encapsulation means we set up the class so only methods in the class with the variables can refer to the instance variables. Callers are required to use these methods. Let's take a look at our newly encapsulated Swan class:



### Static

You cannot access a non-static variable in a static way. But you can access a static variable with a instance method.

#### Static Initialisation Blocks

A final variable that has not been initialised yet can be initialised in a static block.

Static initialisers make your code hard to read, but there is one case in which they are common - when you need to initalise a static field with multiple lines.


### Autoboxing
