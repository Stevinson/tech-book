# Java Notes

## Methods

### Predicate functions

These are used to only carry out a block of code on a items that fulfill certain criteria. They return a boolean based on whether the argument to the predicate function matches the predicate. For example:

```java
for (Class item : items)
{
	if (!filter.test(item))
	{	
		continue;
	}
}
```

### Operators

#### Arithmatic Operators

1. If an arithmatic operator is applied to two different types, the smaller type is promoted to the larger type.
2. Java binary arithmatic operators cause types smaller than an `int` to be promoted to an `int` (except for **unary** operations).

**Pre-increment** and **post-increment** operators differ in that they return the new-value or the old-value of the operation. Note that this can mean that they can return different results if used in specific ways.

### Flow

###### Continue Keyword

The `continue` keyword escapes the current iteration - i.e. to the boolean logic. `if` and `switch` statements do not react to `continue`.

###### Break Keyword

This is different from `break`, which transfers control to the enclosing statement. `if` statements do not react to `break`.

###### Optional Labels

These allow higher scoped loops to escaped.

### Reflection

Reflection is code that is able to inspect other code in the same system. A common usage of this in statically typed languages is calling a method on an object if that method exists:

```
Method method = foo.getClass().getMethod("doSomething", null);
method.invoke(foo, null);
```





## XML

* **JAXB** is used for binding XML schemas and JAVA representations, allowing XML to be used in JAVA applications.

Marshalling

1. Map the schema of the XML file

2. Unmarshall the XML

3. Modify the XML object in memory

4. Marshall the modified object wherever

   ​

## Error Handling

### Executors

`log4j` is a Java based logging utility. It has multiple layers of logs - trace, debug, info, warning, error and fatal.



## Java Environment

### Class Paths

* The PATH environment variable is a series of directories in which Windows looks fro programs. It allows you to be able to conveniently run the executables from any directory without having to type the full path of the command.

* N.B. Windows accepts both `/` and `\` as folder separators within a path, and works just as well within `PATH`.

* N.B. Windows treats consecutive folder separators as one logical separator, i.e. `C:\FOLDER\\` == `C:\FOLDER\`

* To check is `PATH` already contains a pathm we need a way to convert any given path into a canonical form, due to the reasons above (and further syntax points). To do this the `~s` modifier is used to remove enclosing quotes. We use `FINSTR` regular expressions to classify a path as wither qualified or relative. A normal qualified path must start with `<letter>:<separator>`, whilst a UTC path always starts `<letter>:<separator>`.

* The **Uniform Naming Convention** (UNC) Path defines the location of a resourse on a network. it works on a network level rather than an operating system level, and so has to have a global standard.

* **Mapped drives** are specific to certain computers.

  ​



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

###### Questions

1. ​

