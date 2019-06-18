# Python

## Conda

* `conda env list` : List all of your conda environments

* `conda create --name <name>` : Create a new environment

* `conda install -c anaconda django` : Install Django within the conda environment

* `conda list` : List all the packages installed on the current conda env.

* `conda env remove -n <name>` : remove an environment
---

## General

### APIs

* `datetime.timedelta(days=1)` is a means of getting a relative timestamp.

* Http404 (and presumably the other error codes) are classes, see django.http.Http404

* `django.shortcuts.get_object_or_404()` is a frequently used 

#### Regex

* {m,n} causes the resulting regular expression to match from m to n repetitions

* `\s` : When the UNICODE flag is not specified, this matches any whitespace character

* `\S` : When the UNICODE flag is not specified, this matches any NON-whitespace character

* `+` : Causes the regex to match 1 or more repetitions of the preceeding regex.

* `?` : Causes the regex to match 0 or 1 repetitions of the preceeding regex.

* `(?:...)` : TODO EdS:

* `|` : OR. e.g. A|B will match either A or B.  An arbitrary number of regexs can be separated by a pipe.

* `!` : is a negative search, i.e. matches if the regex doesn't match next

* `*` : 0 or more repetitions of the regex

### Concepts

* Error handling is achieved using try, except blocks. An exception is then thrown using the **raise** keyword.

* A try/ except block can also have an else statement or a finally statement. THe else statement runs when there is no exception but before the finally statement.

* **dunders** are names with two leading and two trailing underscores such as `__all__` and `__version__`. They should be placed after the module docstring but before any import statements.

---

## PEP8


