# Unity - mlagents package

This consists of a low-level API to interact directly with a Unity environment - `mlagents.env` - and an entry point to train - `mlagents-learn`.

## `mlagents.env`

Key objects in the python API are:

1. `UnityEnvironment` - main interface between Unity and my own code. It is used to start and control a simulation or training session. 

This has a `env.step()` function that, given an action and memory, sends a step signal to the environment.

2. `BrainInfo` - contains all the data from Agents in the simulation (e.g. observations and rewards)

3. `BrainParameters` - describes the data elements in a `BrainInfo` object

## Curriculum Learning

Each brain can have a curriculum, these curriculums are held in a metacurriculum, which allows different Brins to follow different curriculums in the same environment. 

## Proximinal Policy Optimisation

`mlagents` uses a RL technique called PPO that uses a NN to approximate the ideal function that maps an agent's observations to the best action an agent can take in a given state. This algorithm runs in a separate Python process, communicating with the running Unity application over a socket.

### PPO Parameters

* Gamma: this is the *discount factor* for future rewards. Typical range: 0.8 - 0.995

* Lambda: This parameter is used in calculating the *Generalised Advantage Estimate*. This can be thought of as how  much the agent relies on its current value estimate when calculating an updated value  estimate. Typical range: 0.9 - 0.95

* Buffer size: How many experiences (actions, rewards, observations) should be collected before we do any learning or updating of the model. It should be a multiple of the batch size. Typical range: 2048 - 409600.

* Batch size: The number of experiences used for one iteration of a gradient descent update. Typical range (continuous): 512 - 5120 (discrete): 32 - 512.

* Epochs: The number of passes through the experience buffer during gradient descent. Decreasing this will ensure more stable updates, at the cost of slower learning. Typical range: 3 - 10.

* Learning rate: corresponds to the strength of each gradient descent update step. This should be decreased if learning is unstable, and the reward does not consistently increase. Typical range: 1e-5 - 1e-3.

* Time horizon: corresponds to how many steps of experience to collect per-agent before adding to the experience buffer. It should be large enough to capture all the important behaviour within a sequence of an agent's actions. Typical range: 32 - 2048.

* Max steps: How many steps are run during the training process, and therfore should be increased for more complex problems. Typial range: 5e5 - 1e7

* Beta: The strength of entropy regularisation, which makes the policy more random, i.e. ensuring agents explore the action space during learning. It should decrease alongside increases in reward. Typial range: 1e-4 - 1e-2.

* Epsilon: The acceptable threshold of divergence between old and new policies during gradient descent updating. Typial range: 0.1 - 0.3

* Normalise:

* Number of layers: Typial range: 1 - 3.

* Hidden units: Typial range: 32 - 512

* Sequence length

* Memory size

* Curiosity encoding

* Curiosity strength

### Training Statistics

Tensorboard must be used to see these.

* Cumulative reward:

* Entropy: 

* Learning rate:

* Policy loss: 

* Value estimate:

* Value loss:

## `mlagents`

* A `UnityEnvironment` contains brains which are responsible for deciding the actions of their associated agents.

* States refer to a vector of variables that correspond to relevant aspects of the environment for an agent. 

* Observations refer to a set of relevant pixel-wise visuals for an agent.
