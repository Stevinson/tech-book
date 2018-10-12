# Kubernetes

In Kubernetes there are different **Kubernetes hosts**. Kubernetes takes care of managing hosts in clusters. By doing this this they can run containers. These containers are in pods.

## Pods

Within **pods** there are containers.

Also in a pod there are references to the **storage**.

All pods are monitored and if anything goes wrong then new pods are scheduled.

A **service** is a pod that has been made visible to the external world.

## Architecture

There is a **master node** and **worker nodes**.

### Master node

* The **api server** receives commands from **kubectl**.

* **etcd** -

* **scheduler** -

* **controller manager** -

### Worker node

* The **container engine** makes it possible to run the containers.

* **Service proxy**

* **kubelets**

## Other

Alternatives to Kubernetes include **Docker Swarm** and **Apache Mesos** and **Amazon ECS** and **RedHat OpenShift**.
