`Collections.emptyList()` gives an empty list.

There are `Lists` and `List`s.

# Lists

`Lists.newArrayList` used to create.

## Deletion

The `subList()` method can be used to delete part of a list. The method eliminates the need for explicit range operations (of the sort that commonly exist for arrays). Any operation that expects a list can be used as a range operation by passing a subList view instead of a whole list. For example, the following idiom removes a range of elements from a list:

```Java
list.subList(from, to).clear();
```
