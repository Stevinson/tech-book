# Java APIs

## Core APIs

### Arrays

* Have a `.length` property

* If a value does not exist in an array then the `binarySearch()` method will return the index where the searched for value would reside, minuses one, and returns this value negated.

### ArrayList

* Have a `size()` method.

* Have a static `.equals()` method, unlike the `Array` class. Calling it on an `Array` will just use the `==` compare mechanism.


----


## Primitives and equivalent objects

### Integer

* `parseInt()` returns an `int`.

* `valueOf` return an `Integer`.

### Long

`nextlong()`

Returns the next pseudorandom, uniformly distributed long value from this random number generator's sequence.

To create a `long` you add an `L` after the number, whilst to create a `Long` you need to new up a `Long` object with the `new` keyword.


----



## Strings

### String

* Java will convert `int`s to `String`s in some cases, so some cases that one would expect to not compile actually get compiled. See the following examples:

```
int num1 = " " + 7; // Compiles
int num2 = 7 + " "; // Compiles
int num3 = " " + 7 + 7; // Does not compile
```

### StringBuffer

* Have a `capacity()` method.

* Have a `length()` method.

* The `substring()` method returns a string, not a `StringBuffer`, and does not modify the underlying `StringBuffer`, which is different to all the other methods on the class.


---


## DateTimes

For a list of the all the valid Java timezones click (here)[http://joda-time.sourceforge.net/timezones.html].

---

## Optional

`of()` : This is how you assign values to an Optional.

`isPresent()` : Returns a boolean based on whether the Optional has a value or not.



## Infrequently used APIs

### `Class.forName()`

A call to Class.forName("X") causes the class named X to be dynamically loaded (at runtime). A call to forName("X") causes the class named X to be initialized (i.e., JVM executes all its static block after class loading). Class.forName("X") returns the Class object associated with the "X" class. The returned Class object is not an instance of the "x" class itself.

Class.forName("X") loads the class if it not already loaded. The JVM keeps track of all the classes that have been previously loaded. This method uses the classloader of the class that invokes it. The "X" is the fully qualified name of the desired class.
