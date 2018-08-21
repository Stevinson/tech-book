# OCA Exam Notes

## Chapter 3

### Autoboxing

Jave will convert a primitive int to an object Integer to add it to an ArrayList through the wonders of autoboxing.

Note that in method overloading, when the primitive int version isn't present, it will autobox. However, when the primitive int version is provided, there is no reason for Java to do the extra work of autoboxing.

Note that Java can only accept wider types. An int can be passed to a method taking a long parameter. Java will not automatically convert to a narrower type. This means that if you want to pass a long to a method taking an int parameter, you have to add a cast to explicitly say narrowing is okay.
