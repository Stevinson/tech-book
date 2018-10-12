# Python for Machine Learning


## Image manipulation

* dot producting an array (that represents a colour image) with [0.299, 0.587, 0.144] will convert that image to greyscale.

## General Numpy

* The colon is used for specifying a range of values that can then be used to return parts of a matrix. e.g. If a is a 3x3 matrix then a[:1] returns the first row.

* The ellipsis in Python is a placeholder for the rest of the array dimensions not specified. e.g. for a 3d array then a[...,0] is the same as a[:,:0].

* The `.shape` method returns the dimensions of an array

## Convolution

For convolution, TensorFlow accepts images of dimensions: *[number of images, width, height, channels]*.


# Plotting

When you have a tensorflow distribution, to plot with a ramge use:

```
plt.hist(a, 100, (-4.2, 4.2));
```
