# Exceptions and Errors

## Exceptions

An exception is when there is something wrong with the code.

             Object
               |
            Throwable
               |
    Error  --------  Exception

### Throwable

Java exceptions can be categorised as those that need the **throws** clause and those that don't. Anything that extends the `Throwable` class can be thrown

## Errors

Unlike an exception, an error occurs when there is something wrong with the JVM (for example it is out of memory), and as such is more pressing an issue.
