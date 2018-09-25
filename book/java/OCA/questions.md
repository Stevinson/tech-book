# Notes from Example Questions

* `NegativeArraySizeException` - Thrown if an application tries to create an array with negative size.

* When using the command line command `javac` you must also place the extension`.java` at the end of the class you want compiled.

* **Composition** is the has-a relationship, which is created by using member variables.

* You cannot use primitive types for collection types.

* An instance variable is a variable declared inside a class but outside a method and are associated with an instance of a class.

* A class variable is another term for a static variable.

* An entry point in Java consists of a `main()` method with a single `String[]` argument, a return type of `void`, and modifiers `public` and `static`. Note that the modifier `final` is optional.

* The only package that is always imported in every Java class is `java.lang`.

* Static methods do not have access to any class instance variables.

* Overloading and overriding occur when the method names are the same but overriding occurs when the parameter lists are the same, whilst overloading occurs when the parameter list is different.

* You are allowed underscores in numeric literals (though not at the beginning or the end).

* `double` > `float`

* Java automatically widens a type.

* Objects get initialised to null, whilst primitives get initialised to 0 (along with Strings being null i.e. empty string).

* *Automatic variable initialisation occurs for instance variables but not method variables.*

* A decimal will automatically be a `double`; to make it a `float` it needs to be cast with an `f`.

* All the primitive type names are reserved words and therefore cannot be used as variable names.

* Strings can be set to null.

* You cannot access a non-static variable in a static way. But you can access a static variable with a instance method.

* `parseInt()` returns an `Integer` whilst `valueOf` return an `int`.

* A newly constructed `Double` object can be cast as either a `Double` or a `double` due to autoboxing.

* Underscores are allowed between any two digits in a literal but not at the beginning, end or eitherside of a decimal point.

* Java, unlike other languages, does not convert from integers to booleans in if clauses, meaning that a compilation error will occur.

* The `switch` statement only supports the primitive types: `byte`, `short`, `char`, '`int` and the classes: `String`, `Character`, `Byte`, `Short`, `Integer`, as well as enums.

* boolean operators such as `&&` can only be called on `boolean` expressions

* Java evaluates from left to right so if there is both a mathematical expression and a string in the same expression, then if the mathematical expression happens to the left of the string it will calculate that mathematically before automatically turning the expression into a string.

* Ternary conditions require both sides to be of compatible types, so if you had true evaluating to a string but false evaluating to an int, this would result in a compile error. (if being assigned)

* The `&` is called a **conjunctive** operator, whilst `&&` is called the **conditional conjunctive operator**.

* ArrayList -> .size() whilst Array -> .length

* `Arrays.binarySearch(array, searchTerm)`

* `sort()` and `binarySearch()` are the methods that can be called on arrays. `binarySearch()` requires for the array to be sorted.

* When declaring an array, if you are not providing the values that go in it, you must declare the size.

* StringBuilders `insert` puts the value of the second argument into the index of the first argument, i.e. the index of the final array of the number is created.

* Stringbuilders delete with 2 arguments: the first is inclusive and the second not, i.e. the character at the first index will no longer exist but the one at the second will. If the second argument is out of bunds, it just deletes to the end and no error is thrown.

* The `break` keyword can take an argument of the loop to break.

* Java uses pass-by-value to copy primitives and references of objects into a method.

* The only variables always available to all instances of the class are those declared static. This is because public variables are not available to another instance if that instance does not have a reference to the object.

* When a method is declared as final in Java it means that can't be overridden (for object scope) or hidden (for static). This allows a developer to create functionality that cannot be changed by subclasses, hence guaranteeing the functionality.

* Java only inserts a no-argument constructor if there are no other constructors (with any amount of arguments) in the class.

* Variables passed into a method are passed by value, however, when an array is passed a reference to the object is passed and so can be modified.

* `return` can still be called in a method that returns `void`, just not with any object or literal.

* Method names can include $ signs, underscores but not hyphens or reserved words such as new.

* Overriding: 1. The child method must have the same signature, 2. The child method must be at least as accessible as the parent, 3. The child method may not throw a checked exception that is new or broader than the class of any exception that is thrown by the parent method, 4. The return class of the child method must be the same or a subclass of the return type of the parent method - This is known as **covariant return types**.

* A **hidden method** occurs when a child class defines a static method with the same name and signature as a static method defined in a parent class. The same four rules defined above for overriding methods still apply, along with the following additional rule: 1. The method defined in the child class as static must be marked as `static` if it is marked as `static` in the parent class. Likewise, the method must not be marked as `static` in the child unless it is marked as `static` in the parent.

* public, final and static are assumed when defining a variable in an interfaces.

* When defining methods in interfaces, they are implicitly public. They **cannot** be made final, whether they are static or default or abstract.

* A child class will automatically put in a super() call in its constructor. However, if the parent does not have a no-argument constructor then the automatic no-arg constructor will cause an error.

* **abstract interface methods**: they are implicitly public (but can also be explicitly public).

* A class cannot have two methods with the same signature.

* Declaring a method in a parent class as final does not mean that you cannot create a new method with the same signature in a child, it just means that you cannot change the implementation of the final method.

* Inheritance can be implemented with both extending and implementing.

* The package-private modifier (i.e.default) is narrower than protected

* Interfaces can extend (i.e. be the child of) other interfaces, however, they cannot implement another interface.

* An abstract class can extend a concrete class.

* You cannot instantiate an abstract class.

* *An abstract method may only be declared in an abstract class, otherwise the code will not compile.*

* An abstract method may not be given an implementation.

* A method may not be defined as both abstract and private.

* The key distinction between reference types and object types is that assigning a reference type has no impact on the underlying object.

* A `try` block must include either a `catch` or `finally` block, or both.

* Java has a rule called the **handle or declare rule**. For checked exceptions, Java requires the code to either handle them or declare them in the method signature.

* A **checked exception** includes Exception and all subclasses that do not extend RuntimeException.

* The order of catches is important. Subclasses must be caught *before* their superclasses.

* The code in the `finally` block will be called regardless of whether the `catch` statement being called.

* A `finally` statement requires brackets.

* `Exception`, `RuntimeException` and `Throwable` are all part of the java.lang package.

* An subclass can swallow a checked exception for a method declared in the parent class.

* If a method declares that it will throw a checked exception but throws an unchecked exception, then you still need to catch it.

* `IllegalArgumentException` is when the wrong type is sent to a method, whilst `NoClassDefFoundException` is when code available at compile time is not available at runtime, whilst `ClassNotFoundException` is when the class was not found on the classpath.

* If an exception is thrown by both the catch block and the finally block then the one from the finally block is propagated to the caller, and the catch exception dropped.

* With lambdas, the body does not require a return statement or a semicolon if you haven't used braces.

* `Predicate` is in the java.util.function package and is an interface with one method.

* A lambda can have zero parameters but a Predicate cannot. A Predicate is defined as a type mapping to a boolean.

* `ArrayList` declares a `removeIf()` method that takes a predicate.

* By providing a lambda, this can take the place of the single method of an predicate interface.

* Starting in Java 8, months are not counted from base 0

* Methods that are on both String and Stringbuilder: charAt(), indexOf(), length(), and substring().

* Methods that are on Stringbuilder: append(string), insert(offset, string), delete(int, int), deleteCharAt(int), reverse(), toString()

* The date/time objects added in Java 8, such as LocalDateTime, are also immutable.

* Note that Strings and Arrays are Objects in Java

* When passing an array to a method the reference cannot be modified to impact the reference in the calling method *but the data in the array can be*.

* The following are valid ways of declaring arrays:

```Java
String[] array = new String[] {"one", "two"};
```

* An object can be assigned to a superclass reference or interface without an explicit cast, but cannpot be assigned to a subclass reference without an explicit cast.

* Java does BIDMAS

* Regardless of the type of the reference you have for an object in memory, the object itself does not change. The reference is created by the left hand side of the declaration, whilst the object is created by the code following the new (the right hand side). What has changed is our ability to access methods within the object with the different reference. You only have access to the methods of the type that has been cast.

* Technically, polymorphism is the ability of a Java object to be accessed using a reference with the same type as the object, a reference that is a superclass of the object, or a reference that defines an interface that the object implements (either directly or through a superclass).

* A virtual method is a method in which the specific implementation is not determined until runtime (which is all non-final, non-static, non-private methods).

* An overridden method must be at least as accessible as the method it is overriding.

* A try statement can have 0 or more catch's and 0 or more finally's, but must have at least one of them.

* `LocalDate` uses a static method to new it up rather than a constructor.

* Chained period statements do copile (and return the result of the last one) but is incorrect.

* Some classes are `LocalDate`, `Period`, `DateTimeFormatter`.

* `ArithmeticException` and `IllegalArgumentException`

* The value of a `case` statement must either be a literal or a final variable.

* if a = 5 then a++ will return 5 whilst ++a would return 6

## Repeated

* Objects get initialised to 0, whilst primitives get initialised to null (along with Strings).

## TODO

1. Revise abstract classes

2. Revise StringBuilders

3. Look at the syntax of declaring arrays

4. Go through areas I got wrong in the last exam

5. pre and post increment
