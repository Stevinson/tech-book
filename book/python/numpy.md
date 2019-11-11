# Numpy

## Arrays

* To create an array mask to perform an action on every element of an array: `(array > 1).sum()`

* `np.unique(classified_img, return_counts=True)` - count the number of unique numbers in an array. 

* To convert an array, arr, of booleans to ints use `arr*1`

* To compare two arrays in a boolean manner put the condition in round brackets and then 

## 

* `np.clip(array, min, max)` - values in an array that fall outside the provided range and clipped to the provided limits.

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

## `numpy.testing`

* `assert_equal(a, b)`
