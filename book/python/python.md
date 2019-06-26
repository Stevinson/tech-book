# Python

## Conda

It needs to be added to the path before it can be used!

```
export PATH=/usr/local/anaconda3/bin/:/usr/local/sbin:$PATH
```

* `conda env list` : List all of your conda environments

* `conda create --name <name>` : Create a new environment

* `conda install -c anaconda django` : Install Django within the conda environment

* `conda list` : List all the packages installed on the current conda env.

* `conda env remove -n <name>` : remove an environment
---

## General

* *Duck typing* determines an object's suitability by the presence of certain methods and properties,  rather than the type of the object itself.

* Function defaults are only evaluated once, therefore if you provide a default and call a method multiple times then the argument will retain the value of the argument variable.

* Class variables are internally handled as dictionaries. If an attribute is not found within a class, it will be looked up in base classes. This means that a subclass doesn't have a property independent of the property value of its parents, meaning that it might have an unexpected value.

* When you make an assignment to a variable in a scope, python considers that variable to be local to that scope, Therefore if you make a reference to that variable (e.g. x += 1) before it is set locally then you will get a `UnboundLocalError`.

* Python's *late binding* behaviour means that the values of variables are looked up at the time the inner function is called. This can be shown in the following example:

```python
def create_multipliers():
    return [lambda x: i * x for i in range(5)]

for multiplier in create_multipliers():
    print(multiplier(2))

# This will print all 8's

def create_multipliers():
    return [lambda x, i=i: i * x for i in range(5)]

for multiplier in create_multipliers():
    print(multiplier(2))

# This will print 0,2,4,6,8
```

* Python is smart enough not to import the same module twice, but depending on the point at which each module is attempting to access functions or variables defined in another, problems may occur.

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

---

## Used so far

* `for filename in os.listdir(path)`

```python
with open(path, 'rb') as file:`
	text = file.read()
	doc = doc.decode("utf-8")
```

* `__file__` : variable that contains the path to the file that python is currently importing 

---

A metaclass is the class of a class, i.e. it defines how a class behaves (as opposed to how an object behaves). 

The inner class `Meta` is used in Django to provide metadata to the `ModelForm` class. Any information that is not a form `Field` can be considered metadata. Some examples are `model` - the model class to use for creating Form, and `fields` - a list of fields to include in the Form. The decision was made to use this instead of just having class sttributes as it provides a cleaner API..

---
# String Literals

* When a string is prefixed with an `r`, i.e. `r'string'`, which means that the string has a slightly different syntax than a plain string literal. Backslashes are no longer *escape sequences* (i.e. newlines, tabs, backspaces, etc.). Backslashes must be doubled up in plain string literals to avoid them being taken as escape sequences. This exists because regexs are heavy with backslashes. 

* `r` is a byte string whilst `ur` is a Unicode string, which will take up more memory space.

---


## Class Methods

The `classmethod` decorator means that the class receives the class as implicit first argument (just like an instance method receives an instance). It differs from a `@staticmethod` in that whilst it is bound to the class and not the object, it cannot access or modify the class state (e.g. a class variable that is applicable to all instances),