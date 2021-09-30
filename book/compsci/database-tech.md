# Databases

## General

### Index

A **database index** is a data structure that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space to maintain the index structure. They can be created using one or more of a database table. An index is a copy of selected columns of data from a table that can be searched very efficiently that also includes a low-level disk block address or direct link to the complete row of data it was copied from.

#### Sequences

A **sequence** is a function that generates integer numbers in either ascending or descending order within a range, to generate keys for a table.

```db2
START WITH 1
INCREMENT BY 1
MINVALUE 1
NO CYCLE
CACHE 5000
NO ORDER
```

## db2

### Constraints

#### Primary Key Constraints

A **unique key constraint** ensures that there are no duplicate values in the key.

A **primary key** is a unique constraint based on the key that is of primary importance to the table.

#### Foreign Key Constraints

A **foreign key** is a set of columns in a table that which are required to match at least one primary key of a row in another table.

##

OLD TABLE, NEW TABLE and FINAL TABLE can be used to see what has changed after an update.

---

## Scans

Scan Types:

* Sequential Scan
    * Basically a brute-force retrieval from disk
    * Scans the whole table
    * Fast for small tables

* Index Scan
    * Scan all/some rows in an index; look up rows in heap
    * Causes random seek, which can be costly for old-school spindle-based disks
    * Faster than a Sequential Scan when extracting a small number of rows for large tables

* Index Only Scan
    * Scan all/some rows in index
    * No need to lookup rows in the table because the values we want are already stored in the index itself

* Bitmap Heap Scan
    * Scan index, building a bitmap of pages to visit
    * Then, look up only relevant pages in the table for desired rows

## Joins

Join Types:

* Nested Loops
    * For each row in the outer table, scan for matching rows in the inner table
    * Fast to start, best for small tables

* Merge Join
    * Zipper-operation on _sorted_ data sets
    * Good for large tables
    * High startup cost if an additional sort is required

* Hash Join
    * Build hash of inner table values, scan outer table for matches
    * Only usable for equality conditions
    * High startup cost, but fast execution

