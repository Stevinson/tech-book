# Unity

## `mlagents` package

This consists of a low-level API to interact directly with a Unity environment - `mlagents.env` - and an entry point to train - `mlagents-learn`.

### `mlagents.env`

Key objects in the python API are:

1. `UnityEnvironment` - main interface between Unity and my own code. It is used to start and control a simulation or training session. 

This has a `env.step()` function that, given an action and memory, sends a step signal to the environment.

2. `BrainInfo` - contains all the data from Agents in the simulation (e.g. observations and rewards)

3. `BrainParameters` - describes the data elements in a `BrainInfo` object

## Curriculum Learning

Each brain can have a curriculum, these curriculums are held in a metacurriculum, which allows different Brins to follow different curriculums in the same environment. 
