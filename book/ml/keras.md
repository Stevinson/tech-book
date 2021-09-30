# Keras

**Keras** is a deep learning library that you can use in conjunction with Tensorflow and several other deep learning libraries.

### `backend`

* Any function that has different behaviour at training time and test times takes a *learning phase* flag.

### Classes

#### Sequential

* `Sequential` : A linear stack of layers. Note that before we configure the learning process, which is done via the `compile()` method, we need to provide an optimiser, a loss function and a list of metrics.

* The limitation of `Sequential` is that it does not allow you to create models that share layers or have multiple inputs and outputs.

##### Layers

* `tf.keras.layers.Layer` : a layer is a class implementing common neural network operations. Users instantiate a layer and treat it as a callable. 

* `tf.keras.layers.Flatten` : flatten a multi-dimensional matrix

* `tf.keras.layers.Dense` : 

* `Conv2dTranspose(filters, kernel_size, strides,a ctivateion, padding)` : a transpose convolution.

* `keras.layers.Embedding` - turns positive integers (indexes) into dense vectors of foxed size.

* `tf.layers.concatenate`

### Models

The other main type of model in Keras apart from `Sequential` is called `Model`. This has a fucntional API and gives more flexibility and the ability to create more complex models. 

One must:

* Define the input layer that specifies the shape of input data.


There are two main models in Keras, *Sequential* which is simpler and a functional Api called *Model* which allows for more complex networks with multiple inputs and outputs.
 
#### `Sequential`

A linear stack of layers. Note that before we configure the learning process, which is done via the `compile()` method, we need to provide an optimiser, a loss function and a list of metrics.


#### `Model`

* `Model`: adds training and evaluation routines to a `Network`.

	* `compile()` configures the model for training.


e.g. A multilayer perceptron using this functional API:

```python
# Multilayer Perceptron
from keras.utils import plot_model
from keras.models import Model
from keras.layers import Input
from keras.layers import Dense
visible = Input(shape=(10,))
hidden1 = Dense(10, activation='relu')(visible)
hidden2 = Dense(20, activation='relu')(hidden1)
hidden3 = Dense(10, activation='relu')(hidden2)
output = Dense(1, activation='sigmoid')(hidden3)
model = Model(inputs=visible, outputs=output)
# summarize layers
print(model.summary())
# plot graph
plot_model(model, to_file='multilayer_perceptron_graph.png')
```

#### Training

* `model.fit(x, y, epochs, validation_data, callbacks, verbose)`

This returns a history object. This is a record of all training losses at each epoch, as well as the validation losses if an `validation_data` argument is provided to the tranining.

* `model.evaluate(x_test, y_test))`


### Sessions

```
from keras import backend as K

K.clear_session()
K.set_session(<tf session>)
```

### Helpers

* `keras.utils.to_categorical(truth_val, dimensions)` - This will turn a value into a one-hot vector representing that value, e.g. 3 will become [0 0 0 1 0 0 ...]


