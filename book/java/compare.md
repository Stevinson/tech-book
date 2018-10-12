# Comparison With Other Languages

## Comparison with C

### References vs. Pointers

Usually Java references will be implemented as pointers but there may be an extra layer of indirection to enable easier garbage collection.

The major difference is that you can't do pointer arithmetic with references. In Java you cannot actually get to and manipulate the underlying value of a reference. In C you can add or subtract something to a pointer so that it points to things that are 'nearby'. In Java a pointer points to one thing only.

References are strongly types. In Java you can only cast an `Object` to a `String` if the object is actually a `String`.

These differences make C more powerful but also more dangerous. Flexibility is added to C.
