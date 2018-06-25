# OCA Book

## Chapter 1

### Instance initialisers

Whilst their use is rare, they are useful for:

1. initializer code must handle exceptions

2. perform calculations that can't be expressed with an instance variable initializer.

3. Another case in which instance initializers are useful is anonymous inner classes, which can't declare any constructors at all.

This is because with an instance initializer, you can just write the code once, and it will be executed no matter what constructor is used to create the object.
