# ML devops

## Pachyderm

The docs for Pachyderm can be found [here](https://docs.pachyderm.com/latest/reference/pipeline_spec/#input-required).

A good workflow guide can be found [here](https://docs.pachyderm.com/latest/how-tos/individual-developer-workflow/).

### `pachctl` commands

* `port-forward` - Runs the service made available by default at `localhost:30080/app`

#### Repositories

* `create repo <name>` 

* `put file <repo>@<branch-or-commit> -f "file"` - put a file into the filesystem

* `finish commit <repo>@<branch-or-commit>` - 

* `list repo`

* `list pipeline`

* `inspect <action> <name>` - where the action can be commands such as repo, cluster or commit.

* `list file <repo>@<branch>

* `list commit <repo>@<branch>

* `pachctl list branch <repo-name>`

#### Pipelines

* `create pipeline -f <json config file>` - 

* `list pipeline`

* `delete pipeline <pipeline name>`

* `update pipeline -f <json file> --reprocess --reprocess`

#### Contexts

* `pachctl config list context`

* `pachctl config set context <context-name>` 

#### Jobs

* `pachctl list job`

#### Debugging

* `pachctl list job`

* `pachctl inspect job <job_id>`

* `pachctl logs --pipeline=<pipeline_name>`

#### Other Commands

* `pachctl mount ./pfs` and `pachctl unmount ./pfs` will put the 

NB. This will require having `fuse` downloaded.§

### Concepts

* A Pachyderm repository is a location where you store your data inside Pachyderm.

* A pipeline is a Pachyderm primitive that is responsible for reading data from a specified source (such as a Pachyderm repo), transforming it according to a pipeline configuration and saving it to an output repo. Every time that the input repo has a new commit the pipeline executes a new job. The first time that a pipeline job is ran, the Docker image that is defined in the pipeline spec is downloaded from the specified Docker registry. A pipeline will create an output repo with the same 

* A service is a special type of pipeline that does not process data but provides a capability to expose it to the outside world. For example, one could use a service to serve a machine learning model as an API that has the most up-to-date version of your data.

* A Pachyderm job is an execution of a pipeline that triggers when new data is detected in an input repository. Each job runs your code against the current commit and then submits the results to the output repository and creates a single output commit into your input source.

* Commits belong to a repo, a branch, and a 

* /pfs/images and /pfs/out are special local directories that Pachyderm creates within the container automatically.

* **Contexts** are 

#### Autoscaling

1. Pachyderm scaling



2. Cloud service provider scaling

When a pipeline is created Pachyderm will ask the k8s cluster how many nodes are available.

### Creating a Project

#### JSON config file for pipeline

Example:

```json
{
    "pipeline": {
        "name": "models"
    },
    "transform": {
        "cmd": [
            "/bin/bash"
        ],
        "image": "jjminton/pachyderm_test:22_root",
        "stdin": [
            "source conda/etc/profile.d/conda.sh; conda activate nojira-005",
            "export MLFLOW_URI=http://$PIPELINE_MLFLOW_V1_USER_SERVICE_HOST:$PIPELINE_MLFLOW_V1_USER_SERVICE_PORT",
            "python $config --documents_dir $documents_directory --model_dir /pfs/out --mlflow_tag version:$PACH_OUTPUT_COMMIT_ID --mlflow_tag documents_version:$config_COMMIT --mlflow_tag config_version:$documents_directory_COMMIT"
        ],
        "env": {
            "MLFLOW_EXPERIMENT_NAME": "Test Experiment",
            "GIT_PYTHON_REFRESH": "quiet"
        }
    },
    "input": {
        "cross": [
            {
                "pfs": {
                    "name": "config",
                    "repo": "test_configs",
                    "glob": "/*"
                }
            },
            {
                "pfs": {
                    "name": "documents_directory",
                    "repo": "test_data",
                    "glob": "/"
                }
            }
        ]
    }
}
```

* `transform`
	* `image` - the name of the Docker image that your jobs use
	* `env` - key-value map of environment variables

* `input` - specifies the repose that will be visible to the jobs during runtime.
	* `cross` - cross inputs create the cross product of other inputs, i.e. tuples of the datums in the inputs

* `service` - this states that the pipeline is a long running service rather than a data transformation. The service is exposed outside the container using a Kubernetes service.
	* `internal_port` - the port that the user code binds to inside the container.
	* `external_port` - the port on which it is exposed through the Kubernetes service.

* `paralellism_spec` - can either be `constant` or `coefficient` and describes how Pachyderm parallelises the pipeline.


-------------------------------


## MLFlow

MLFlow has 4 main components:

1. Tracking - 
1. Projects
1. Models
1. Model Registry

### Tracking
---

We use tracking to track local model development before passing containerised computations to Pachyderm for traceable and reproducable simulations on versioned datasets.

MLFlow tracking is organised around the concept of *runs*, which are executions of some piece of data science code. These runs record:

* Code version
* Start and end times
* Metrics, e.g. loss function output
* Outputs

*Experiments* are groups of runs that are grouped together for a specific task. 

An MLFlow tracking server has two components for storage: a *backend store* and an *artifact store*.

The backend store is where run metadata is stored for runs.

#### Tracking Functions

```python
mlflow.create_experiment()
mlflow.set_tracking_uri()
mlflow.start_run()
```

You can also set the MLFLOW_TRACKING_URI environment variable to have MLflow find a URI from there. 


### CLI Commands
---

* `mlflow server --host <ip> --port <port> --backend-store-uri <>` - to run a MLFlow tracking server

	* `--backend-store-uri` configures the type of backend store (file store or database)

* 



