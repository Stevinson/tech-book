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

---

## Juan Presentation

### Parameters

`celery -A <worker> multi` starts all workers together.

`--max-memoy-per-child` child process replaced when amount exceeded

`--max-tasks-per-child`

`concurrency` `--autoscale`: defines number of children processes per worker.

`--prefetch-multiplier` 

`celery -A <worker> inspect ping` : status of all workers

`celery -A <worker> inspect stats` :

`celery flower -A <worker>` : go to localhost:5555 for GUI showing stats on celery

`celery -A <worker> -Q <queue-name> purge` : remove all pending tasks if NOT running

Whilst its running: 
`celery -A <worker> -Q <queue-name> purge`
`celery -A <worker> inspect reserved`
`celery -A <worker> revoke <task-id-i> <task-id-i>`

`celery -A <worker> inspect registered` query which tasks registered

### Queues 

Tasks are sent to queues. 

Task queues are determined by the `CELERY_TOUTES`

CELERY_ROUTES = {
	
}

### Redis

If using redis as the broker:

`reids-cli -n 2 type model` : gets pending tasks

`reids-cli llen model` : number of items in queue

`reids-cli del model` : purge the queue

`reids-cli lrange model 0 0` : imnspect the queue

### General

Non-finished tasks can be: 1. queued, reserved or active.

### Eigen

Helper functions: 

`redis_queues.get_contents_of_queue`

## Python

* `@task` defines a task

* `.delay()` or `apply_async()` return an `async_result`. This constructs tyask payload and is pushed to broker's queue.

* `.s()` or `.si()` creates a celery canvas. 

* Celery canvas allows you to combine tasks to design more complex work flows. (chain, map, starmap, chunks, group and chord)

* `chain` : Work in sequence. Runs tasks one after another.

* `map` and `starmapp` : sequentially execute the same task for each argument in a list of arguments.

* `chunks`: same as map but splits tasks into several tasks.

* Concurrently:
	* `group` : get a `GroupTask`
		* enable `chords`
		* still depends on concurrency/autoscale
	* `chord` : finalization task that only gets excecuted once all tasks in group have finished
		* Requires a celery results backend.
		* chord tracking done by polling when using `django-celery-results`
		* creates noise
		* huge payload - therefore only use when number of tasks is low
		* Hard to debug

* Task signatures (`.s()`) and with immutable=True (`.si()`)

* Getting results from task
	* `.get()`	 It will block until task is completed.
	* `ignore_result=True` in task decorator means you don't get the results in the django model db.

* Register a task (lettings celery know)
	1. define task in eigenapp.celery.app
	2. define task in module that gets imported by dsjango setup mechanism

* `bind=True` means you want the first parameter to be the task itself, allowing task.report and task.retry

* Lifecycle of a task:
	1. delay or apply_async
	2. pushed to queue
	3. payload constructed and state=PENDING
	4. `TaskResult` created - 
	5. Status changes (SUCCESS/FAILURE/REVOKED)

* Tasks can also vbe started by cron-like scheduler e.g. memory-check, disk-check, log-rotate, fail-lost-incomplete-tasks, cleanup-eigen-task-result-task,
celery.app.builtins.add_backend_cleanup_task, periodic-rhythm

* Signals: execute code based on events originin from Workers or Tasks. `@task_success`, `@task_prerun`, `@worker_init`

* `LOGGING_SETUP` to `DEBUG`


---

## Celery Multi

Use celery multi to start and stop several workers on the same call
  

Celery-multi parameters:

* `-Ofair`

* `--prefetch-multiplier=1`

The combination of Ofair and prefetch=1 yields a worker's child to hold
up to 1 task in transit (plus the one being executed). We do this to prevent
a child that is currently executing a slow task from "locking" a next-task that
could be executed by other child that is free.
This is relevant for workers running long tasks.
For short tasks,  this reduces the maximum rate of tasks/second that can be
achieved, however we are not under that scenario for now.

* `--max-memory-per-child`:

Restart a worker's child after it has exceeded this amount of memory usage
        This is a safety measure against memory leaks.
        Note that the a child process is restarted graceful: Only after is has
        finished executing a task.
        This means that this is not a guarantee that the RAM consumption will not
        exceed this value, as a task being executed, exceeding the memory,
        will not be interrupted.

* `--max-tasks-per-child`:

Restart a worker's child after it has executed this number of tasks. This is a
        safety measurement against memory leaks.

* `--autoscale` / `--concurrency` :

Workers create and remove children processes according to the size of queues.
        We added a celery auto-scaler (eigenapp.autoscale.EigenAutoscaler) that will
        prevent scaling UP when memory is low or load is high.

* `--max-tasks-per-child`

Our experience shows that a memory leak problem might be stronger for ML tasks.
      However, this requires more investigations.
      The reason why we do not set this to 1 is because we need to take advantage
      of already-loaded modules and objects that otherwise will need to get reloaded
      on every tasks execution, thus reducing speed of task completion.

      The longer this value is, the faster the overall-tasks complete, however,
      we need to test and investigate how memory leaks may limit this.
      This is particularly important for ml stats as they load
      SPACY model which gets cached in memory and which is slow to load

      This parameter needs to be investigated and changed with max-memory-per-child
      too

* `--beat`:

This starts the celery beat service to be run by this worker
      Celery beat is in charge of executing cron-like-defined tasks defined by
      common.eigenapp.celery.app.setup_periodic_tasks function

      NOTE: It is important that --beat is only run within a single worker, otherwise
      scheduled tasks will get replicated.

