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


---

* variable method

* Placeholder method

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

### Variables and placeholdesr

```python
state = tf.variable()
init_op = tf.global_variables_initializer()

a = tf.placeholder(datatype)  # Create a placeholder than data will be placed in when run
session.run(computationVariable, feed_dict={a:1})
```
