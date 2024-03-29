# Tensorflow and Keras

## TensorFlow

**Tensorflow** is an open-source software library for machine learning, which allows you to keep track of all of your models and see visualisations.

**Keras** is a deep learning library that you can use in conjunction with Tensorflow and several other deep learning libraries.

**Jupyter Notebook** is used to write up. Download [here](https://jupyter.readthedocs.io/en/latest/install.html#new-to-python-and-jupyter).

### General

* C++ and C backend meaning that it runs quicker than just python.

* Python and C++ API.

### Dataflow Graph

TensorFlow defines computations as graphs and these are made with operations, forming a dataflow graph. This has 2 units: **node** (mathematical operation) and **edge** (multidimensional array or tensor).

To execute these operations we must launch the graph into a session.

This is so efficient because instead of returning to Python all the time, it creates all the operations in the form of graphs and executes them once with the highly optimised backend.

* A `Graph` contains a set of `Operation` objects, which represent the units of comuptation and `Tensor` objects which represent the units of data betweeen operations.
---

* variable method

* Placeholder method

---

### Syntax

#### Imports

```python
#Importing
import numpy as np
from scipy import signal
from scipy import misc
import matplotlib.pyplot as plt
from PIL import Image
import tensorflow as tf
import matplotlib.patches as mpatches
```

#### Setup

```python
session = tf.Session()
result = session.run(computationVariable)
session.close()
```

#### `with` block

Using a `with` block stops the need to close sessions every time.

```python
with tf.Session() as session:
  result = session.run(computationVariable)
```

#### Variables and placeholders

In short a variable is a trainable value such as a parameter whilst a placeholder is an input value, such as the training data or truth outputs.

```python
state = tf.variable()
init_op = tf.global_variables_initializer()

a = tf.placeholder(datatype)  # Create a placeholder than data will be placed in when run
session.run(computationVariable, feed_dict={a:1})
```

The `tf.get_variable()` method is higher level that a tf.Variable object and gets an existing variable with these parameters or creates a new one. It also facilitates the sharing of variables, for example if you want to use a multi-GPU setting.

#### Function

```python
def methodName(x): return x
methodName.eval(session=sess)
```

#### Adding noise

```python
y_data = x_data * 3 + 2
y_data = np.vectorize(lambda y: y + np.random.normal(loc=0.0, scale=0.1))(y_data)
```

### Equations

```python
tf.reduce_mean
tf.train.GradientDescentOptimiser(learning_rate)
optimizer.minimize(loss)

tf.random_normal(
    shape,
    mean=0.0,
    stddev=1.0,
    dtype=tf.float32,
    seed=None,
    name=None
)
```

#### ML

```python
np.convolve(A,B) # Convolves two arrays
```


#### Images

* To convert an image to a matrix of values between 0 and 255: `np.asarray(image)`

* Then to plot the matrix image:

```
imgplot = plt.imshow(array)
imgplot.set_cmap('gray')
plt.show(imgplot)
```

#### To be placed

* `DataSet` : look this up


* `tf.reshape(<input>, <new_shape>)`

* `tf.shape(<tensor>)` - returns the shape of a tensor


### Tensorflow Models

When you train a model with tensorflow, various checkpoint files are created to save them:

1. Meta graph files that save the complete tensorflow graph (e.g. variables, operations) and has the extension `.meta`
2. Checkpoint files that hold the values of weights, biases, gradients, etc. Instead of the old `ckpt` extension there are now three files:
	* `index` file that is a table of tensors to `BundleEntryProto` which describes the metadata of a tensor
	* `data` file that holds all the variables as a `TensorBundle`
	* `checkpoint` that keeps a record of the latest checkpoint files saved


### Classes

#### `InteractiveSession`


```
run(
    fetches,
    feed_dict=None,
    options=None,
    run_metadata=None
)
```

This method runs one "step" of TensorFlow computation, by running the necessary graph fragment to execute every Operation and evaluate every Tensor in fetches, substituting the values in feed_dict for the corresponding input values.

The value returned by run() has the same shape as the fetches argument, where the leaves are replaced by the corresponding values returned by TensorFlow.


### Other

```
ConfigProto - protocol message
```

### Numpy Operations

There is a Tensorflow equivalent to all Numpy operations:

* `np.mean` -> `tf.reduce_mean`

*
 
### Probabilities

* `tf.nn.softmax()`

* `tf.argmax()` - find the maximum value in a logit to use as the prediction

* `tf.nn.softmax_cross_entropy_with_logits` - calculate cross entrpoy

### Summaries to view data

* `tf.summary.scalar()`

* `tf.summary.FileWriter()`

* `tf.summary.merge_all()`

* `writer.add_summary()`

* `writer.flush()`

### Optimisers

There are several pre-packaged optimisers available:

1. `tf.train.GradientDescentOptimizer()`

2. `tf.train.MomentumOptimizer()`

3. `tf.train.AdamOptimizer()`

