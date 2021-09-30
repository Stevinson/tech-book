# Numpy

## Arrays

* To create an array mask to perform an action on every element of an array: `(array > 1).sum()`

* `np.unique(classified_img, return_counts=True)` - count the number of unique numbers in an array. 

* To convert an array, arr, of booleans to ints use `arr*1`

* To compare two arrays in a boolean manner put the condition in round brackets and then 

* `np.arange()` - create an array which contains evenly spaced values within the provided values.

---

## Distributions

### Normal

```python
np.random.normal(
	loc=0.0,
	scale=1.0,
	size=None
)
```

Where `size` is a tuple that defines the output shape.

---


## `numpy.testing`

* `assert_equal(a, b)`


---


## Maths

* Transpose

`numpy.matrix.transpose()`

* Dot product

`np.dot(a, b)`

* Logarithm

`np.log(x)`

* Exponential

`np.exp()`

---


## Other

* `np.clip(array, min, max)` - given a range this will clip the values that lie out of the provided values to the edge values.

* `np.arange()` - create an array which contains 

* `np.newaxis` is used to increase the dimension of the existing array by one more dimension, when used once

* `np.memmap` can be used when a dataset does not fit in memory.
  
```python
filename = "my_mnist.data"
X_mm = np.memmap(filename, dtype='float32', mode='write', shape=X_train.shape)
X_mm[:] = X_train`
```
