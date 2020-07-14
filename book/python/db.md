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

* Or to only keep specified columns, thebn: `data_frame[['col1', 'col2']]`

* `shape` property returns the dimensions of the dataframe in the format (number_of_rows, number_of_columns).

* A `date` field can be split into [day, month, year] components by using `df.year == 12`, etc. The string format can be converted to a `pd.datetime` by using the `pf.to_datetime` function.

* To iterate over the rows in a DataFrame:

```
for index, row in df.iterrows():
	<code>
```

* `DataFrame.sparse.from_spmatrix()` - create a new DataFrame from a scipy sparse matrix.

* `s.map({'cat': 'kitten', 'dog': 'puppy'})` converts all of ceertain values to other values.

* `df.replace({"col1": dict})` converts all of ceertain values to other values in the column col1 with the values in the dict dict.

#### Series

* One-dimensional ndarray with axis labels (including time series). Labels need not be unique but must be a hashable type. The object supports both integer- and label-based indexing and provides a host of methods for performing operations involving the index. Statistical methods from ndarray have been overridden to automatically exclude  missing data (currently represented as NaN). Operations between Series `(+, -, /, *, **)` align values based on their associated index values-- they need not be the same length. The result index will be the sorted union of the two indexes. 

* `series.max()`: find the max in a series


#### Other

* `CategoricalDType` - Type for categorical data with the categories and orderedness. 

```
pandas.CategoricalDtype(categories=None, ordered: Optional[bool] = False)
```

This can then be used on a dataframe to label each element as a member of one of the catagories with:

```
t = pd.CategoricalDtype(categories=['b', 'a'], ordered=True)
pd.Series(['a', 'b', 'a', 'c'], dtype=t)
```


---


## PostgereSQL

```
psql
CREATE DATABASE myproject;
CREATE USER myprojectuser WITH PASSWORD 'password';
ALTER ROLE myprojectuser SET client_encoding TO 'utf8';
ALTER ROLE myprojectuser SET default_transaction_isolation TO 'read committed';
ALTER ROLE myprojectuser SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE myproject TO myprojectuser;
```

* `\q` : exit the postgres shell

* `\l` : list all databases

* `\dt` : list tables in current database

* `\d <table name>` : describe a table

* `\c` : switch connection to another database

```
docker pull postgres
mkdir ~/.docker/volumes/postgres
docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v ~/.docker/volumes/postgres:/var/lib/postgresql/data  postgres
```
