# Regression

## Linear Regression

Suited to estimating contnuous variables.

We minimise the squared error, i.e. we define the equation to be minimised as loss.

## Logistic Regression

Suited to classification tasks. Whilst called logistic regression, it is actually a probabilistic classification model. It takes linear regression and transforms the numeric estimate into a probability with the logistic function (which is a sigmoid):

theta(y) = exp(y) / 1 + exp(y) = p