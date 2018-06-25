# TensorFlow

**Tensorflow** is an open-source software library for machine learning, which allows you to keep track of all of your models and see visualisations.

**Keras** is a deep learning library that you can use in conjunction with Tensorflow and several other deep learning libraries.

##

* C++ and C backend meaning that it runs quicker than just python.

* Python and C++ API.

## Dataflow Graph

* Makes use of a dataflow graph. This has 2 units: **node** (mathematical operation) and **edge** (multidimensional array or tensor).


---

* variable method

* Placeholder method

---

## CNNs in Tensorflow

**Convolutional Neural Networks** (CNNs) contain multiple copies of the same neuron, and all the neurons share the same wights, bias and activation function. As a result, the neuron can be 'reused' in different parts of the input.

CNNs operate differently from traditional NNs in which every neuron in a layer is connected to every neuron in the previous layer. This type of connection is general purpose and makes no assumptions about the features in the input data, meaning that it tends to be expensive in terms of memory and computation.  

Each neuron in a CNN however is only connected to a few nearby local neurons in the previous layer, and the neurons share the same wights and biases. This type of structure only makes sense when the data is spatial, and has local features that can be extracted. So it makes sense to apply a small window around a set of pixels in order to look for images features. By using the same weights, the new assumes that the feature is equally likely to occur at every input position. This means the window can search over the whole image, and can be scaled and rotated.

**Feature engineering** is the process of extracting useful patterns from the input data in order to help the predictive model understand the true nature of the problem. CNNs are extremely good at not only finding features but also combining them together to increase the complexity of the patterns. The final yers use these generated features for the task at hand.

A kernel which sums adjacent pixels and averages them results in blurring an image. A kernel which only subtracts two adjacent pixels serves to highlight edges, as pixels of similar intensity will subtract to zero. This is useful for the beginning layers of a CNN.

```python
np.convolve(A,B)
```

The numpy library is typically not enough for deep learning.

```Tensorflow

```

---

## Recurrent Neural Networks

Traditional neural networks are not well suited to sequential data. This is because a NN does not remember the data it has analysed. However, if there are sequential dependencies in the data (e.g. if its sunny today it is more likely to be sunny tomorrow). In this case we need to move to another type of model like a **recurrent neural network**.

Has one layer but also has a state so that it can remember the analysis that it has up to this point.

Unlike Convolutional Neural Networks (CNNs) which use forward propagation, or rather, move forward through its pipeline, RNNs utilize backpropogation, or circling back through the pipeline to make use of the "memory" mentioned above.
