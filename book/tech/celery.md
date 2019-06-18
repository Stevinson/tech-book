# Celery

Celery is an asynchronous job queue used for running tasks in the background. It is based on distributed message passing. It is focused on real-time operation but also supports scheduling. 

For example, if you need to make a certain API call every hour, Celery makes scheduling such periodic tasks easy. Celery can execute processes in the background as resources become available so that the appliction can continue to respond to client requests.

It requires a **broker** to pass messages between a Django project and the Celery workers. We use **Redis**. 


## Tasks

Celery utilises tasks, which can be thought of as regular python functions that are called with Celery.




## Code

```bash
conda install -c conda-forge celery
```

```python
from celery.decorators import task

@task(name="task_name")
```