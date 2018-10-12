# Streams

* Streams differ from collections in a number of ways:
  * No storage
  * Functional (i.e. produces a result but does not modify the source)

* *Stream operations are combined to form stream pipelines*. A pipeline consists of a source (e.g. a Collection) and then intermediate operations.

## API

### `map()`

```Java
<R> Stream<R> map(Function<? super T,? extends R> mapper)
```
Returns a stream consisting of the results of applying the given function to the elements of this stream.
This is an intermediate operation.

This is an example of a *stateful lambda* (i.e. one whose result depends on any state which might change during the execution of the stream pipeline).

### `flatMap()`

This returns a stream which is itself the result of replacing each element of the stream with the contents of a mapped stream produced by applying the provided mapping function to each element.

So whilst map produces only one output value for each input value, the flatmap operation produces an arbitrary number of values for each input value. The reason why it is called flat is that the 'clumps' of values returned by each call to the mapper function are not distinguished at all in the output stream.

If you have the requirement of turning a stream of streams into a 1 layer stream, i.e. Stream<Stream<Object>> -> Stream<Object> then you need to use the identity function as flatMap must be provided with a method. So:

`Stream<Object> flatStream = nestedStream.flatMap(Function.identity())`

### `collect()`

```Java
<R,A> R	collect(Collector<? super T,A,R> collector)
```

Performs a **mutable reduction** operation on the elements of this stream using a Collector. Mutable reduction accumulates input elements into a mutable result container, such as a Collection or StringBuilder, as it processes the elements in the stream.

### `filter()`

```Java
Stream<T> filter(Predicate<? super T> predicate)
```

Returns a stream consisting of the elements of the given stream that match the provided predicate.

### `peek()`

```Java
Stream<T>	peek(Consumer<? super T> action)
```

Returns a stream consisting of the elements of this stream, additionally performing the provided action on each element as elements are consumed from the resulting stream.

Peek is mainly for debugging purposes and as such the method used on the elements of the stream should not modify them. It is mainly for observing the elements, e.g. checking the size of each element or logging each element.

### `skip(long n)`

Returns a stream consisting of the remaining elements of this stream after discarding the first n elements of the stream.

### `limit(long maxSize)`
`
Returns a stream consisting of the elements of this stream, truncated to be no longer than maxSize in length.

# Generator Functions





## Consumers

``` Java
Interface Consumer<T>
```

A consumer represents an operation that accepts a single input argument and returns no result.

It is a funtional interface whose functional method is `accept(Object)`
