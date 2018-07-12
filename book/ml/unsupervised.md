# Unsupervised learning

The network inly receives the input data. The goal is to find patterns in the data and to create new representations of it. Data clustering, feature extraction and data dimension reduction are a few sample uses.

## Restricted Boltzman Machines


**Restricted Boltzman Machines (RBMs)** are shallow NNs that have 2 layers. They reconstruct the input. Neurons within the same layer are not connected.

The input/ visible layer consists of several forward and backward passes in which the RBM reconstructs the input data with an eye on finding relationships between inout features.

3 steps:

1. **Forward pass**. During this step every input is combined with an individual weight and an overall bias. The result goes to the hidden layer, whose neurons may or may not activate.

2. **Backward pass**. The activated neurons in the hidden layer send the results back to the visible layer where the input will be reconstructed.

3. **Assessment of the quality of the reconstruction** by comparing it to the original data. The weights are adjusted using this error and the three steps are repeated until the error is sufficiently low.

Advantages:


* RMSs excel when working with unlabelled data, which most data is.

* During the learning process RBMs extract features from the input, deciding which ones are relevent.

* They are generally more efficient at dimensionality reduction than PCA.

They are grouped as **autoencoders** as they actually encode their structure. The basic idea of these NNs is to take unlabelled data, encode them, and try and reconstruct them based on the most valuable identified features.

Instead of a cost measure, autoencoders use **loss** as a quality metric, which is the amount of information lost in the reconstruction of the input.

RBMs can be though of as generative models.


## Autoencoders
