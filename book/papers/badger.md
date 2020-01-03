# Academic Papers

## Badger Architecture

**Rosa et al. 2019**

An agent is made up of many experts which all share the same communication policy (expert policy) but have different internal memory states. 

There are two levels of learning:

1. An *inner loop* in which an agent's behaviour emerges as a result of experts communicating with each other. 

2. An *outer loop* in which an expert policy is discovered over generations of agents.

The roles of experts and connectivity among them is assigned dynamically at inference time. 

Instead of having a handcrafted expert policy they use a "multi-agent meta-learning" approach 
