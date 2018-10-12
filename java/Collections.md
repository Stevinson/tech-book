# Collections

## Lists

`Collections.emptyList()` gives an empty list.

There are `Lists` and `List`s.

`Lists.newArrayList` used to create.

### Deletion

The `subList()` method can be used to delete part of a list. The method eliminates the need for explicit range operations (of the sort that commonly exist for arrays). Any operation that expects a list can be used as a range operation by passing a subList view instead of a whole list. For example, the following idiom removes a range of elements from a list:

```Java
list.subList(from, to).clear();
```

## Sets

### API

`contains()`

Returns true if and only if this set contains an element e such that `(o==null ? e==null : o.equals(e))`.

### Tree Sets

`java.util.TreeSet<E>`

This is a `NavigableSet` implementation based on a `TreeMap`. The elements are ordered using their natural ordering or by a `Comparator` provided at set creation time. This implementation guarantees a log(n) time cost for the basic operations (`add`, `remove` and `contains`).

## Maps

### Tree Maps

`java.until.TreeMap<K, V>`

Sorted in a similar manner to the TreeSet.

TreeMap is a SortedMap.

### SetMultiMap

// TODO

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
