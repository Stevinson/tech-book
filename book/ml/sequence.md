# The Sequence Notes


## 5. Federated Learning


----


## 29. Active Learning


Active learning is a form of semi-supervised learning that attempts to proactively select a subset of training examples to be labeled from a set of unlabelled instances.

---


## 30. Privacy Preserving Machine Learning

Find a balance in the friction between intelligence and privacy. 

1. Cryptographic methods rely on cryptographic protocols, such as secure multi-party computations or homomorphic encryption to train machine learning models using encrypted datasets. This means the model performing operations against a dataset without having access to its original clear version.

2. Perturbation methods add random noise to training datasets n order to prevent attacks such as membership inference. e.g. diffferential privacy.


# TODO EdS: Google's PATE

# TODO EdS: PySyft

---


## 33. sMPC - secure multi-party computation

### Papers

* *CrypTFlow*: Secure Tensorflow Inference

The model and query are required to be hidden from the protocol's participants. Organised into 4 main components:

1. Athos: transforms TF code into sMPC protocols
2. Porthos: 3-party sMPC protocol
3. Aramis: modifies the code to ensure that it is secure against malicious adversarial attacks

### Notes

* Facebook's *CrypTen* enables sMPC in Tensorflow models


----


## 34. Homomorphic Encryption

Seen as the ideal method for private machine learning solutions. The core ideas of HE are based on a mathematical phenomenon known as *homomorphism* which is "a mapping for a mathematical set into or onto another set or itself in such a way that the result obtained by applying the operations to elements of the first set is mapped onto the result obtained from by applying the corresponding operations to their respective images in the second set." It allows computations to be carried out on ciphertext as opposed to the original data. There are two types of HE:

**Partial Homomorphic Encryption**. Given the encryption of two data primitives E(a) and E(b), PHE can compute E(a + b) OR E(ab). Examples include Unpadded RSA, EIGamal and Paillier.

**Fully Homomorphic Encryption**. Can cimpute E(a+b) AND E(ab)

### Papers

* [nGraph-HE](https://arxiv.org/abs/1810.10121)

nGraph-HE lloks to act as an abstraction layer that allows data scientists to design DL models in frameworks and then deploy there models to HE cryptosystems that operate on encrypted data. This hides the HE complexities from the model development process.

* [Microsoft SEAL](https://github.com/microsoft/SEAL)

The HE library that every data scientist should know about. It employs two encryption methods: 

	1. BFV
	2. CKKS


----


## 35. Decentralised AI

From data collection to model deployment, the centralised nature of the lifecycle of ML applications makes it difficult for data science startups to compete with large tech incumbents. The topic has caught new momentum with the emergence of decentralised runtimes such as blockchains. In theory, blockchain runtimes enable the implementation of end-to-end lifecycles of ML programs without relying on a centralised authority. This recent boom has been caused by 3 technologies:

1. Blockchain. By modelling trustless interactions across different elements of the lifecycle of ML models such as data collection, training and optimisation.

2. Federated learning. The idea here is that you partition the learning process across computations in nodes within a distributed network.

3. Private ML

### Papers

* [AI on blockchain](https://arxiv.org/abs/1907.07247)

A decentralised framework which allows different parties to collaborate in the lifecycle management of ml models. It is called the Decentralised and Collaborative AI on Blockchain (DCAI). It structues the adding of data to an ml model in 3 components:

1. Incentive mechanism which incentivises high-quality data.

2. DataHandler which stores data and meta-data.

3. The model which encapsulates the specific ml model.

* [singularityNET](https://github.com/singnet)

SingularityNET is a platform that enables the implementation and consumption of AI services in a decentralised model.

Agents:  An Agent is an AI service that has been published onto the SingularityNET network. It has an associated Agent contract that manages pricing and exposes metadata such as the service endpoint. 

Registry: AI services are published onto a publicly accessible central registry on the blockchain. 

SNET Daemon: An AI service developer exposes their service to the network by running the SNET Daemon alongside their service. The SNET Daemon interacts with the blockchain to facilitate authorization and payment for services, acting as a passthrough for making API calls to the service. 

Escrow: Currently exposed as a Job contract on the blockchain, funds are held in escrow during an interaction between an end-user and an Agent. The escrow is funded before a service can be called and funds are not released from escrow until the services have been delivered. 

SNET DApp: The SingularityNET DApp is a front-end for exploring available AI services and interacting with them through a web-UI. 


----


## 36. Blockchains



----


## 37. Model Drift



----


## 38. Uber Ludwig 0.3


Ludwig is a framework for simplifying the processes of selecting, training and evaluating machine learning models for a given scenario. Think of it as configuring rather than coding machine learning models. 

1. `hyperopt` - performs automated hyperparameter searches and returns possible configurations.

2. Integrates with *Weights and Biases*

3. Provides support for transformers via its integration with *Hugging Face*'s *Transformers* respository.

4. Tensorflow 2 backend

4. A host more data source types (e.g. hdf5, json, etc.)


---


## 39. Memory in Depp Learning Architectures


# TODO EdS:[Compressive Transformers for Long-Range Sequence Modelling](https://arxiv.org/abs/1911.05507)

# TODO EdS: Hugging face transformers


---


## 40. On the Measure of Intelligence

It is a paper by Francois Chollet. The thesis is as such: we need quantitative and actionable method that measure intelligence in a way that shows similarities with human cognition. His defintion of intelligence is:

"The intelligence of a system is a measure of its skill-acquisition efficiency over a scope of tasks, with respect to priors, experience, and genrelisation difficulty."

From an AI perspective, if we take two systems that start from a similar set of knowledge priors, and go through a similar amount of experience with respect to a set of tasks not known in advance, the system with higher intelligence is the one that ends up with greater skills.

An intelligent system would be an AI program that generates a specific skills to interact with a task. A neural network generation and training algorithm would be an intelligent system, and the inference-mode game-specific network it would output at the end of a training run on one game would be a 'skill program'. A program synthesis engine capable of looking at a task and outputting a solution program would be an 'intelligent system.'

**Abstraction and Reasoning Corpus** (ARC) is a dataset proposed by Chollet intended to serve as a benchmark for his definition of intelligence. It is comprised of a training and evaluation set. The training set features 400 tasks and the evaluation 600. It is available [here](https://github.com/fchollet/ARC) on Github.


---


## 41. Long Short-Term Memory Models

In simple terms, LSTMs are a variation of RNNs capable of learning long term dependencies. The core architecture is based on a memory cell and three regulator units called gates (input, output and forget). The gate structures are a way to regulate what information gets stored. Each gate is based on a sigmoid neural net layer.


# TODO EdS: Manifold ML debugging


---

## 42. LinkedIn's Dagli



---


## 43. Bidirectional Long Short-Term Memory Models

Conceptually, BLSTMs are architectures that combine two lSTMs: one taking the input in a forward directionm and the other in a backward direction. The core idea is that the neural network can be trained using all the available information from the past and the future at any given time.

---


## 44. DeepMind's Agent57


---


## 45. Encoder-Decoder Architectures and Sequence-to-Sequence Learning


In general, RNNs are very good at working with models in which the dimensionality of both the inputs and outputs is known and fixed. However, for problems such as machine translation or question-answering models the output series is not known upfront. Encoder-decoder models are based on three fundamental concepts:

1. Encoder: an RNN that reads the input series and translates it into a single-dimensional hidden vector.

2. Hidden vector: captures a hidden, temporary state of the input which is used to compute a context variable that represents a semantic cummary of the input sequence.

3. Decoder: A RNN that takes the hidden vector as an input vector and generates the output sequence.


# TODO EdS:  Contextual Slot Carryover for Disparate Schemas at Amazon Alexa

# TODO EdS: `tf-seq2seq` general purpose encoder-decoder framework for Tensorflow.



---


## 46. LinkedIn's Pro-ML



---


## 47. Energy Based Models (EBM)


Energy based models are a type of generative model - where the underlying data distribution is modelled. EBMs represent probabilistic distributions over data by assigning an unnormalised probability scalar (or energy) to each input data point.


---


## 48. Deep Double Descent Hypothesis



---


## 49. Time Series Forecasting

Conceptually, a time-series forecasting model attempts to predict the value of a target variable for a given entity at a given time. Typically, entities represent logical groupings of temporal information, such as the orders in a stock order book or the measurements from a temperature sensor. The two most important dimensions for understanding a time-series forecasting model are the nature of the problem and the methods used. Even though there are many types of time-series problems, most of them fall into one of the following categories:  

1. Univariate: Problems that model a single series of information over time.  

2. Multivariate: Problems that model multiple, inter-related information over time.  

3. Multi-step: Problems that attempt to forecast multiple steps into the future.  

4. Multivariate, Multi-step: Problems that forecast multiple steps into the future for different series.  

5. Classification: Problems that predict a discrete class given an input time-series.  

Some classic approaches:

1. Benchmark Forecasting: Methods such as naïve forecast or geometric random walk that build up forecasting intuition by adding additional layers of complexity. These methods are rarely used in complex scenarios.  

2. Exponential Smoothing Forecasting: Methods that remove the variability within a series. This group includes techniques such as simple exponential smoothing or Holt’s linear trend.  

3. Autoregressive Forecasting: Methods such as the famous ARIMA or SARIMA that focus on using observations from previous time steps in several layers of regressive models.  

### Papers

* [Time-series Extreme Event Forecasting with Neural Networks at Uber](http://www.cs.columbia.edu/~lierranli/publications/TSW2017_paper.pdf)

* M3 processes around 45 TRILLION metrics per day, which is far beyond the performance of any conventional time-series infrastructure. To handle this throuput, M3 relies on an architecture based on the following components:

	1. M3DB
	2. M3Query
	3. M3 Aggregator
	4. M3 Coordinator
	5. M3QL


---


## 51. ARIMA and AutoML for time-series

ARIMA (auto-regressive integrated moving average) is a classical time-series algorithm which consists of three main properties:

1. Auto-regressive: a pattern in the growth/decline in the data is accounted for

2. Integrated: the rate of growth/decline is accounted for

3. Noise between consecutive time points is accounted for

There are three main properties that characterise an ARIMA model for the series *Y*:

1. *P*: the number of preceeding values that have to added/subtracted to *Y* 

2. *D*: the number of times that the data has to be 'differenced' to produce a stationary signal

3. *Q*: the number of preceeding values for the error terms that are added/subtracted


### AutoML and time-series

[Google blog](https://ai.googleblog.com/2020/12/using-automl-for-time-series-forecasting.html) that evaluates AutoML architectures in time-series forecasting models.

Time-series forecasting might be one of the most difficult problems for applying AutoML techniques. For starters, there is the challenge of trying to predict future data that can have a completely different distribution from the training dataset. Additionally, time-series forecasting models are very vulnerable to poor data quality of missing data points, which makes it incredibly hard for machine learning models to generalize knowledge.

To address the data quality challenge, Google architecture fills the gaps with a trainable vector and lets the model adapt to the missing data points. 

Additionally, the Google architecture tries to predict not only the target value, but also the probability that the value at this time step is non-zero, and then combines the two predictions. This method helps to address the intermittency of predictions in time-series models.

It competed in the [M5 competition](https://mofc.unic.ac.cy/m5-competition/), a time-series modelling competition.

### GluonTS

GluonTS is Amazon's time-series forecasting approach, built using the Apache MXNet deep learning architecture. GluonTS extends the capabilities of simpler models with deep learning capabilities, such as CNNs and LSTMs. It also provides an end-to-end pipeline for the building of time-series forecasting models. It is open source and can be found [here](https://github.com/awslabs/gluon-ts/).


---


## 53. Prophet

Prophet was developed for time-series problems that have long-term, short-term seasonality patterns or that include outlier events that deviate from historical trends. Conceptually, it is an additive time-series forecasting model where non-linear trends are fit with long-term and short-term seasonality effects.

y(t) = g(t) + s(t) + h(t) + e(t)

where:

* g(t) trend models non-periodic changes
* s(t) trend models periodic changes (i.e. seasonality)
* h(t) ties in effects of holidays
* e(t) covers idiosyncratic changes not accomodated by the model

Implementations of Prophet are available in many frameworks and you can rapidly test the algorithm using the original [open-source code](https://github.com/facebook/prophet). 

### Facebook AR-Net

An approach that uses both autoregressive techniques and neural networks for time-series forecasting. The core idea is to mimic an autoregressive process with a neural network.

### PyTorch Forecasting

PyTorch Forecasting is an open source framework to enable the creation of deep learning-based time-series forecasting models. It is build upon PyTorch Lightning and includes the following foundational building blocks:

1. Base Model: The `BaseModel` abstracts the training and instrumentation of time-series forecasting models.

2. High-level API

3. Model library: it includes implementations of modern neural network architectures such as Amazon's DeepAR or Google's Temoral Fusion Transformer.

4. Metrics: a series of multi-horizon metrics and integration with interpretability tools such as TensorBoard.

The developer experience can be summarised with the following steps:

1. Create a traing dataset with the `TimeSeriesDataSet` class

2. Create a validation dataset with the `_dataset` function

3. Instantiate a time series model

4. Create a `Trainer`

5. Train the model

6. Optimise the model

It is open source and can be found [here](https://github.com/jdb78/pytorch-forecasting).



---

## 54. Facebook ReBeL

**Recursive belief based learning** (ReBeL) is a reinforcement learning model that is able to master several imperfect-information games.

The idea at the core of ReBeL is to transform imperfect-information games to perfect-information equivalents. Fecebook refers to the imperfect-information game as the **discrete representation** and the second as the the **belief representation**. The magic of ReBeL relies on representing the environment as a history of belief representations known as the **public belief state** (PBS). The PBS effectively describes the state of a game not only as a sequence of actions but also as their probability of occurence. The belief representation can be considered a continuous-state perfect-inforamation game, as we should assume that all player's strategies are common knowledge and, therefore, the probability that a player chooses a given action is known to all their opponents. 

The main contribution of ReBeL was to combine this technique with reinforcement learning and self-play methods in order to produce an autonomous agent that can play several imperfect-information games. They used a gradient-descent-like algorithm caled **counterfactual regret minimisation (CFR)** to enable efficient searches in high dimensional spaces.


---

## 55. DeepAR

**DeepAR** applies deep neural networks to time-series forecasting scenarios, specifically leveraging recurrent neural networks for solving large scale time-series problems.

DeepAR focuses on the scaling challenge related to problems that include a disproportionately large number of time-series. Many real-world scenarios include thousands or millions of related time-series, which become extremely complicated to tackle with traditional statistical models given that they would need to develop forecasts for the individual time-series, which could have vastly different distributions.

Instead of fitting separate odels for each time-series, DeepAR learns a global model for each time-series in a dataset. Architectually, DeepAR leverages RNNs in a way that allows the simultaneous training of many time-series. DeepAR trains a network in the whole conditioning data range. This network outputs the state, which contains information about the conditioning range to the prediction range, which is then used by a second network of the same architecture, which outputs the final prediction.

It has proven effecting in producing forecasts with very little history by learning from similar time-series. 

Implementations of DeepAR have been included in several platforms including AWS SageMaker, AWS Forecast, GluonTS and others.

**DeepGLO** uses deep neural networks that can make predictions across a large number of correlated time-series.

It uses a variant of **temporal convolutional neural networks (tCNNs)** that have been optimised for high-dimensional time-series datasets. Amazon calls that new variation **Deep Leveled Network** which are designed to handle high-dimensionaltime-series data with wide variation at scale, without normalisation. Specifically, they include two tCNNs, the first of which predicts future points in the global dataset, while the second predicts variations with respect to the mean value of those predictions. Next, the DLN is combined with temporal matrix factorisation methods to produce a model called DLN-MF. Conceptually, this allows modelling of all the time-series as linear combinations of basis time-series. Finally, we get DeepGLO, which is a dual network architecture with a DLN-MF network that outputs predictions based on global values while a second DLN network predicts based on local values

**sktime** is a library that enables the usage of modern time-seres forecasting techniques in Scikit-Learn. It provides a consistent programming model for implementing the end-to-end pipeline required in time-series forecasting systems. It tries to enable a consistent model to abstract the following foundational building blocks of time-series forecasting solutions

	* Data preparation 
	* Data transformation 
	* Algorithm selection 
	* Model Tuning
	* Model composition and Ensembling 

It is open-source and can be found[here](https://github.com/alan-turing-institute/sktime).


---


## 56. TODO


---


## 57. Transformer Architectures for Time Series

Google Research's Temporal Fusion Transformers (TFT) tackles the problem of multiple-horizon time-series forecasting, which are problems that predict multiple variables-of-interest at multiple future time steps.

It optimises for multiple-horizon time series by:

* Variable selection: selects the most salient features based on the input
* Gated residual network
* static covariate encoders
* Multi-head attention




---

## 58. OpenAI's CLIP

---

## 59. Time-series: NeuralProphet

---

## 60. Google Switch Transformer

---

## 61. AutoML and its disciplines

---

## 62. Data discovery and management architectures

---

## 63. Hyperparameter optimisation

---

## 64. Architectures at Google, FB, Uber, LinkedIn

---

## 65. Bayesian hyperparameter optimisation

---

## 66. Pluribus Poker Bot

---

## 67. NAS - neural architecture search

---

## 68. Decoupling ML pipelines from hardware - Run:AI

---

## 69. 

---

## 70. Typed Features

---

## 71. Differentiable Architecture Search

---

## 72. Tecton

---

## 73. Meta-Learning and AutoML

---

## 74. Training Models at Scale

---

## 75. N-shot learning

---

## 76. Model Search

---

## 77. Feature Stores

---

## 78. Feature Stores: Feast

---

## 79. Few-Shot Learning

---

## 80. Tensorflow Quantum

---

## 81. Zero-Shot Learning

---

## 82. ML Monitoring 

---

## 83. One-shot Learning

---

## 84. Snorkel Flow

---

## 85. Reinforcement Learning

---

## 86.

---

## 87.

---
