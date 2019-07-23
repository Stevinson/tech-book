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

## `abc` - Abstract Base Classes






