# Python Packages

## Image Manipulation

```python
!wget--output-document /resources/data/lena.png https://ibm.box.com/shared/static/yqjnv0890doeu3mwb2u97f8rh1p0gd98.png
```


---

## Data Science

### Numpy

* `numpy.arange([start, ]stop, [step, ]dtype=None)`


`dtype` is the type of the array output. If it is not given then the type is infered from the other nput arguments.

* `numpy.normal(mean=0.0, standard_deviation=1.0, size=None)`

Draws ranfom samples from a normal distribution

* `numpy.rand(d0, d1, ..., dn)`

Creates an array with the given dimensions and fills it with randomly sampled values over [0, 1)

### `sklearn`

Short for scikit-learn.

Built on `numpy`, `scipy`, and `matplotlib` and is used for data mining and data anlysis,

### `spaCy`

Described as the Ruby on Rails of Natural Language Processing. Whilst `nltk` is a platform for research, spaCy tries to avoid asking the user to choose between multiple algorithms that devliver equivalent functionality.:wq

## OpenCV

* Some algorithms require the use of opencv types isntead of numpy types and therfore have to be converted forst. this is done in the following manner: `cv.CreateMat(height, width, cv.CV_8U)`

### Plotting

```python
X = np.arrange(0.0, 0.5, 0.1) # Define an independent variable
a = 1
b = 0
Y = a*X + b
plt.plot(X,Y)
plt.ylabel('')
plt.xlabel('')
plt.show()
```

---


## Other

* `zip() [0:N]`

Creates a tuple out of lists.


---


## Web Development

### Serialisationt

* **jsonpickle** is used to serialise any object graph into json. *Pickling* is the process whereby a python object hierarchy is converted to a byte stream and *unpickling* is converting a byte stream to a python object.


---



## Inbuilt Functions

* `zip` - makes an iterator that elements from each of the iterables, i.e. returns an iterator of tuples where the i-th tuple contains the i-th element from each of the argument sequences.

### `abc` - Abstract Base Classes

### `itertools`

* `chain()` : make an iterator that retirns elements from the first iterable until it is exhausted, then proceeds to the next iterable - so that consecutive sequences are treated as a single sequence. e.g. `chain('ABC, 'DEF)` -> A B C D E F

### `os`

* `chdir(<path>)` : used to change the current working directory to the one specified.


---


## `click`

Click is a package for creating CLIs with as little code as necessary. It works by declaring commands through decorators.

### `command`

```python
@click.command()
```

This makes the proceeding function become a callable script.

### `option` and `argument`

```python
@click.option('--count', default=1, help='number of greetings')
@click.argument('name')
def hello(count, name):
	pass
```

These give the ability to pass arguments to the CLI command.
