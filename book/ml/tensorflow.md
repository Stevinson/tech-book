# TensorFlow

**Tensorflow** is an open-source software library for machine learning, which allows you to keep track of all of your models and see visualisations.

**Keras** is a deep learning library that you can use in conjunction with Tensorflow and several other deep learning libraries.

**Jupyter Notebook** is used to write up. Download [here](https://jupyter.readthedocs.io/en/latest/install.html#new-to-python-and-jupyter).

## General

* C++ and C backend meaning that it runs quicker than just python.

* Python and C++ API.

## Dataflow Graph

TensorFlow defines computations as graphs and these are made with operations, forming a dataflow graph. This has 2 units: **node** (mathematical operation) and **edge** (multidimensional array or tensor).

To execute these operations we must launch the graph into a session.

This is so efficient because instead of returning to Python all the time, it creates all the operations in the form of graphs and executes them once with the highly optimised backend.


---

* variable method

* Placeholder method

So far we have used Variables to manage our data, but there is a more basic structure, the placeholder. A placeholder is simply a variable that we will assign data to at a later date. It allows us to create our operations and build our computation graph, without needing the data. In TensorFlow terminology, we then feed data into the graph through these placeholders.

---

## Syntax

### Imports

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

### Setup

```python
session = tf.Session()
result = session.run(computationVariable)
session.close()
```

### `with` block

Using a `with` block stops the need to close sessions every time.

```python
with tf.Session() as session:
  result = session.run(computationVariable)
```

### Variables and placeholders

```python
state = tf.variable()
init_op = tf.global_variables_initializer()

a = tf.placeholder(datatype)  # Create a placeholder than data will be placed in when run
session.run(computationVariable, feed_dict={a:1})
```

### Function

```python
def methodName(x): return x
methodName.eval(session=sess)
```

### Adding noise

```python
y_data = x_data * 3 + 2
y_data = np.vectorize(lambda y: y + np.random.normal(loc=0.0, scale=0.1))(y_data)
```

## Equations

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

### ML

```python
np.convolve(A,B) # Convolves two arrays
```


### Images

* To convert an image to a matrix of values between 0 and 255: `np.asarray(image)`

* Then to plot the matrix image:

```
imgplot = plt.imshow(array)
imgplot.set_cmap('gray')
plt.show(imgplot)
```
