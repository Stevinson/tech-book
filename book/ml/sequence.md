# The Sequence Notes


## 5. Federated Learning


----


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


## 39.


---


## 40. On the Measure of Intelligence

It is a paper by Francois Chollet. The thesis is as such: we need quantitative and actionable method that measure intelligence in a way that shows similarities with human cognition. His defintion of intelligence is:

"The intelligence of a system is a measure of its skill-acquisition efficiency over a scope of tasks, with respect to priors, experience, and genrelisation difficulty."

From an AI perspective, if we take two systems that start from a similar set of knowledge priors, and go through a similar amount of experience with respect to a set of tasks not known in advance, the system with higher intelligence is the one that ends up with greater skills.

An intelligent system would be an AI program that generates a specific skills to interact with a task. A neural network generation and training algorithm would be an intelligent system, and the inference-mode game-specific network it would output at the end of a training run on one game would be a 'skill program'. A program synthesis engine capable of looking at a task and outputting a solution program would be an 'intelligent system.'

**Abstraction and Reasoning Corpus** (ARC) is a dataset proposed by Chollet intended to serve as a benchmark for his definition of intelligence. It is comprised of a training and evaluation set. The training set features 400 tasks and the evaluation 600. It is available [here](https://github.com/fchollet/ARC) on Github.





