# SKLearn

## General

* sklearn uses a "greater is better" rule - a predictors score should be higher if it is better than another at prediction.

* `CountVectorizer` : 
	* `fit_transform(raw_documents)` - learn the vocabulary dictionary and return term-document matrix. This can then be turned into a sparse matrix with `.toarray()`
	* `get_feature_names()` - 
	* `fit()` - learn a vocabulary dictionary of all tokens in the raw documents?
	

* `DecisionTreeClassifier`
	* `fit()`
	* `score()`


* `GradientBoostingClassifier(num_estimators, learning_rate, max_depth)`
	

## Feature Extraction

### `DictVectorizer`

Transformer that turns lists of mappings (dict-like objects) of feature names to feature values into Numpy arrays or sparse matrices to use with sklearn estimators.



## TODO

1. `AutoSklearnPredict`
2. `sklearn.preprocessing.label.fit_transform`
3. 
