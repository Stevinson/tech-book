# Definitions

## Maths

* A positive **Skewness** has a heavy tail to the right whilst a negative skewness is to the left.

* **Kurtosis** is a measure of how peaked around a the mean a distribution is. A positive kurtosis has more mass.

* The covariance

* By differentiating the **moment generating function** we get the moments. The kth moment of a distribution is given by the average of x^

## ML

* A **generative model** is one in which we build models for classes and then attempt to classify an input by matching against the generated models. They specify a probability distribution over a dataset of input vectors. They can be used for both supervised and unsupervised problems. In unsupervised tasks we attempt to form a model of P(x), where x is an input vector. In a supervised task we first form P(x|y) and P(y), and use this with Bayes' rule to form P(y|x).

* A **discriminative** classification problem attempts to distinguish between classes based on features of the classes.

* **Convolution**. There are three ways in which to apply a kernel of a matrix:

  1. `np.convolve(x, h, "full")` - implements zero padding
  1. `np.convolve(x, h, "same")` - only add padding to the left and top of the matrix (i.e. leading). The output will be the same as the input.
  1. `np.convolve(x, h, "valid")` - no padding. The output will be *input size* - *kernel dimension* + 1

Note that when convolving you must invert the filter, otherwise you would be performing **cross-correlation**.
