# Record self-deduplication task

## To-do

1. Write a tuple of the origin id and data source id
2. Write the set for these
3. Filter out the duplicates from this set (using a equals and hashcode)
4. Use a filter method, which uses a predicate. i.e. filter by deduplication. Potentially do this by filtering optionals (look at the stream API and Optional usage.)
