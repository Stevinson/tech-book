# OCA Exam Notes

## Chapter 3

### Autoboxing

Jave will convert a primitive int to an object Integer to add it to an ArrayList through the wonders of autoboxing.

Note that in method overloading, when the primitive int version isn't present, it will autobox. However, when the primitive int version is provided, there is no reason for Java to do the extra work of autoboxing.

Note that Java can only accept wider types. An int can be passed to a method taking a long parameter. Java will not automatically convert to a narrower type. This means that if you want to pass a long to a method taking an int parameter, you have to add a cast to explicitly say narrowing is okay.


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
