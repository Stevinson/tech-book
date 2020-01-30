# Week 1 

## Linear Regression

a(x) = + w1x1 + ... + wdxd

Write this in vector form. Columns are 1 feature (on every example) and rows are 1 sample.

Need to measure an error of a model - the most popular being the mean squared error.

We need to minimise this w.r.t our parameters.

Inverting a matrix for high-dimensional data is hard so this is hard to do analytical.

### Multi-class classifier:

1. k-linear models, one for each class

Accurcay does not have gradient wrt parameters so we cannot optimise it and accuracy does not assess confidence.

logits = class scores from a linear model.

Use softmax to transform logits into probabilities.

 Similarity between predicted class probabilites and target values class probabilities can be measured using cross entropy, which is the minus log of the predicted class probability of the true class.