# Maps

`Map<K,Collection<V>>`

## HashMaps

### HashMaps and null

When a null is passed as a key to a HashMap it is handled as a special case:

#### `put()` and `get()`

A *null* key is put in bucket 0 and the value passed into the method is put as the value. This means that the `get()` method then returns the value in bucket 0

## LinkedHashMap

`LinkedHashMap<K,V>`

// TODO

## MultiMap

`MultiMap<K,V>`

An object that maps keys to collections of values. It extends `Map`, adding a few new methods that accept values of V directly, rather than values of Collection<V>.

## ListMultiMap

A Guava class.

A `MultiMap` that can hold duplicate key-value pairs and that **maintains the insertion ordering of values for a given key**.
