# Databases in Python

## Pandas

Databases for python.

### Methods

* `read_csv()`: reads a comma separated csv and returns a 2-dimensional data structure called a `DataFrame`.

### Classes

#### `DataFrame`

* `groupby()` - A groupby operation involves some combination of splitting the object, applying a function, and combining the results. This can be used to group large amounts of data and compute operations on these groups.

* `loc()` - Access a group of rows and columns by label(s) or a boolean array

* `count()` - The number of rows

* `head()` - print the first few rows. Useful as a check that the previous command ran did so correctly.

* `drop(['Q1'], axis=1)` - drop columns from a `DataFrame`. Note that this is not an in-place method, i.e. you need to assign it

* Or to only keep specified columnsm, thebn: `data_frame[['col1', 'col2']]`
