# Introduction to Deep Learning - Week 2

http://playground.tensorflow.org for an online platform to compose MLPs

To train an MLP we need to calculate the hidden layer hyper-parameters automatically and fast.

The graph of derivatives is the MLP graph with reversed arrows. The chain rule is the sum of all the paths on this diagram. If you use the chain rule to expand all the derivatives then each term will relate to one backwards path through the MLP. 

To use SGD we use a loss function on the sigmoid-ed output of the neuron. 

Backpropagation uses the fact that the later derivatives in an MLP are reused as you go backwards in the network, meaning the value of each node derivative only has to be calculated once. First you make a forward-pass to determine how the node transforms its inputs and get the values at that point. 

## Matrix Derivatives

Matrix multiplication can be done fast in comparison to loops, and done on both CPU (e.g. BLAS) and GPU (e.g. cuBLAS).

The trace of a matrix is the sum of its diagonal elements and is a scalar.

The matrix of partial derivatives is called he Jacobian. It is useful because 

If C = A.B then `dC/dA = {dc_i,j / da_k,l}_i,j,k,l`

The drivative of a scalar by a vector is a vector: dy/d**x** = [ dy/dx_1 dy/dx_2 ... dy/dx_n]

The derivative of a scalar and a matrix of shape p x q is a matrix of shape q x p.

## Tensorflow

To actually do a computation one needs to define a graph and create a session. This is because the graph is defined in Python and the operations computed in C++. The seesion object owns necessary resources to execute a graph, which occupy RAM. It is important to release these resources when they are no longer needed with `tf.Session.close()`. 

To get the initial variable value in the graph execution environment on eneeds to call the session with `s.run(tf.global_values_initialiser())`.

On euses placeholders for variables that we do not currently have in our hand.
 
