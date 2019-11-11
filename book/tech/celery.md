# Celery

Celery is an asynchronous job queue used for running tasks in the background. It is based on distributed message passing. It is focused on real-time operation but also supports scheduling. 

For example, if you need to make a certain API call every hour, Celery makes scheduling such periodic tasks easy. Celery can execute processes in the background as resources become available so that the appliction can continue to respond to client requests.

It requires a **broker** to pass messages between a Django project and the Celery workers. We use **Redis**. 


## Tasks

Celery utilises tasks, which can be thought of as regular python functions that are called with Celery.


## Command line args

* `-Ofair` : When a Celery worker using the *prefork pool* receives a task, it needs to delegate that task to a child process for evaluation. `-Ofair` enforces a scheduling strategy that ensures that no task is sent to a child process that is already executing a task.

* - `--prefetch-multiplier` : the number of tasks that a worker can reserve for itself. If you have long tasks then you wanty this number to be low btu if if theyere are a lot of short-running tasks and latency is important, then this should be large to allow a lot of tasks per second.

- `--max-tasks-per-child` : the maximum number of tasks that a child can execute before it's terminated and replaced by a new worker.


## Code

### Installation

```bash
conda install -c conda-forge celery
```

```python
from celery.decorators import task

@task(name="task_name")
```

## Location

* We now use autoscaling. This can be found in the `eigen-webapp` container, at `~eigen/eigen/eigenapp`
