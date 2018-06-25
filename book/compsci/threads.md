# Threads

##

Unlike forking, multi-threaded processes share the same data area and CPU.

The life cycle of a thread is: new, runnable, running, waiting, dead.

Threads have a priority associated with them, ranging from low (10) to high (1).

##

* Step 1

As a first step, you need to implement a run() method provided by a Runnable interface. This method provides an entry point for the thread and you will put your complete business logic inside this method.

* Step 2



* Step 3


## Synchronisation

Multiple threads can try to access the same resource and produce unforeseen consequences. To counteract this there is a need to synchronise the action of multiple threads to make sure that only one can access a particular resource at any given point. This is achieved with **monitors**. Each object in Java is associated with a monitor, which a thread can lock or unlock. Only one thread at a time may hold a lock on a monitor. **Synchronised blocks** are used to create threads and synchronise their tasks.

Use `synchronized()`


## Interthread Communication

* `wait()`

Causes a thread to wait until another thread invokes the notify().

* `notify()`

Wakes up a single thread that is waiting on this object's monitor.

* `notifyAll()`

Wakes up all the threads that called wait() on the same object.

## Deadlock

**Deadlock** is the situation where two or more threads are clocked forever, waiting for each other.

## Locks

### ReentrantLock

A **reentrantlock** is owned by the thread last successfully locking, but not yet unlocking it yet.
