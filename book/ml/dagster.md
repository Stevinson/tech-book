# Dagster

[Blog post](https://dagster.io/blog/dagster-the-data-orchestrator)

[Dagster Concepts and Tutorial](https://docs.dagster.io/overview/configuration/)


## High Level

Challenges:

1. Uncontrolled inputs

2. Multi-persona and multi-tool nature

3. Difficulty to develop and test


## Concepts

A **data orchestrator** which introduces the concept of an **orchestration graph**. 

### Solids

A **solid** is a functional unit of computation in the orchestration graph. They descrive the data requirements (inputs/outputs), the configuration (config_schema) and environmental requirements (resources).


#### Solid Context

Provides access to solid_config, loggers, resources, and run ID.

#### Solid Events

e.g. Output, ExpectationResult, TypeCheck



---

### Configuration Schema

The schema ensures that passed config values conform to a particular shape and type. 

Determines the:

1. execution:
2. storage:
3. loggers:
4. solids:
5. resources:

---

### Pipeline


---

### Modes and Resources

Provide a means of controlling the behaviour of multiple solids at pipeline execution time in a similar manner of DI. For example, it may be useful to use modes to vary pipeline bahaviour between deployment environments, such as local_dev. They affest solid behaviour by providing resources to the solids.

