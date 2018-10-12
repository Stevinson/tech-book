# Chapter 2

## Sorting

Sorting an array is achieved by `Arrays.sort()`.

It returns `void`.

## Searching

Searching an array is achieved by `Arrays.binarySearch()` and requires the array to be sorted.

It has a return type of `int` which is primarily the **search key** if is contained in the array. Otherwise it is the **insertion point**, which is defined as the point at which the key would be inserted into the array: the index of the first element greater than they key, or a.length if all the elements in the array are less than the specified key.

```Java
public static int binarySearch(long[] a, long key)
```
