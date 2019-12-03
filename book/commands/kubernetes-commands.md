# Kubernetes

Kubernetes is IBM's strategic choice for managing multiple containers together. Kubernetes is usually provided as a service in the cloud, and IBM provides a version in its clouds. However, it can also be run locally, using a tool called minikube.

(Note that the terminal window used to log in to blue mix etc. has to be the one in which you use hhelm init.)

An app consists of several microservices that are deployed on a cluster as deployment resources. A deployment is the release unit of the app. (I think that deployments will create pods)

Pods are groups of containers that are deployed together on the same worker node. A pod is where the application code (packaged as a Docker container) runs under a Kubernetes context. Although every pod has a unique IP address, those IPs are not exposed outside the cluster without a service. Services allow your applications to receive trafic:

Services are Kubernetes resources that define a logical set of pods and a policy to assess them. Services are exposed in different ways by specifying a type. there are four types: ClusterIP, NodePort, LoadBalancer and ExternalName. Services are the abstraction that allow pods to die and replicate without affecting the performance of the application.

**Minikube**

Pods that are running inside Kubernetes are running on a private, isolated network. They are visible by other pods and services within the cluster, but not outside that network. When we use kubectl we are interacting through an API endpoint. A proxy forwards communications into the cluster-wide, private network.

## Commands

### Minikube

* `minikube delete`

* `minikube start`
  * `—memory 8192` : Increase the memory allocated.
  * `eval $(minikube docker-env)``
  Tell docker to use the reference to the docker daemon running in minikube, rather than your local docker runtime.

* `minikube status`

* `minikube dashboard`

* `minikube ip`

* `minikube run <>`

```terminal
minikube addons enable ingress
minikube addons enable ingress
minikube addons enable kube-dns
```
This enables the ingress and kube-dns minikube addons so that we can access our microservices from our web browser.

### Kubernetes

* `docker build -t <proposed_name> <path_to_image>`
  Build the docker image with Kubernetes.

* `kubectl create -f service.yaml`
  Create a Kubernetes service.

* To list all the services running on kubernetes:

```bashrc
kubectl get services
```

### To create a cluster from the command line:
  - Login and go to the target organisation and space
  - bx cs init
  - bx cs cluster-create —name <cluster-name>
  - To save the IP address and port of something launched on the cluster:
    ```
	nodeip=$(bx cs workers cloudnativedev | grep -v '^*' | egrep -v "(ID|OK)" | awk '{print $2;}' | head -n1)
	```
    And then to get it:
    echo "http://${nodeip}:${port}"
- To access a cluster:
  - bx cs cluster-config <cluster-name>
  - Copy and paste the returned env variable into the command line.
  - kubectl get nodes
  - kubectl proxy
    Launches the Kubernetes dashboard in your browser.

* To find the IP address/ cluster/ troubleshoot:
  * `kubectl get nodes -o yaml` if not using Minikube
  - minikube ip if using Minikube
  * `kubectl cluster-info`
  - kubectl describe pods
  - kubectl logs <pod_name>
  - Commands can be executed directly on the container when the pods are up and running:
    kubectl exec <pod_name> <command>
    And a bash session can be started for a pod:
    kubectl exec -ti <pod_name> bash
    This gives an open console on the container where we run our application. The cource code for the application is at

- To view the cluster locally via Minikube:
  1. kubectl proxy must be run to estblish a proxy so that communications can reach the private Kunbernets network. http://localhost:8001 now displays all the APIs hosted through the proxy endpoint.
  2. http://localhost:8001/api/v1/proxy/namespaces/default/pods/<pod_name>
     This is used to access the webpage.
- To use a new docker image when code has changed:
  1. Check that the kubernetes is configured to the correct cluster:
     kubectl config current-context
     This should return cloudnativedev. If not set it with: bx cs cluster-config <clustername> and paste the returned export command in the command line.
  2. Set the Docker image:
     kubectl set image deployment/bluecompute-web-deployment web-ce=ibmcase/bluecompute-web:tutorial-task8
  3. Ensure that deployment was successful, manually validate the image name and running status:
     kubectl describe rs bluecompute-web-deployment
  4.

---

Notes made at Eigen:

## kubectl

### kubeconfig files

These files are used to organise information about clusters, users and authentication mechanisms. The `kubectl` command uses kubeconfig files to find the information it needs to choose a cluster and communicate with the API server of the cluster.

By default `kubectl` looks for a file named `config` in the `$HOME/.kube` directory.

## apply

This command manages applications through files defining Kubernetes resources. It creates and updates resources in a cluster.


