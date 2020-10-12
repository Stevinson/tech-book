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


