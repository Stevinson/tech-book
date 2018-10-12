# OCA Book

## Chapter 1

### Instance initialisers

Whilst their use is rare, they are useful for:

1. initializer code must handle exceptions

2. perform calculations that can't be expressed with an instance variable initializer.

3. Another case in which instance initializers are useful is anonymous inner classes, which can't declare any constructors at all.

This is because with an instance initializer, you can just write the code once, and it will be executed no matter what constructor is used to create the object.

## Garbage Collection

`System.gc()` is not guaranteed to run.

An object will remain on the heap until it is no longer reachable, which occurs at two times:

1. The object no longer has any references pointing at it.

2. All references have gone out of scope.

It is objects (on the heap) and not their references that get garbage collected.

## finalize()

The `finalize()` method gets called if the garbage collector tries to collect the object. If the garbage collector does not get run then method does get run. If the garbage collector fails to collect the object and tries to run it again later, the method does get called a second time.
