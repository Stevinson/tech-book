# Helm

## About

Helm is a command that streamlines installing and managing Kubernetes applications. Think of it as a homebrew for Kubernetes. It has two parts:

1. A client - helm

2. A server - tiller. This manages releases of your charts.

Charts are Helm packages that contain at least two things:

* A description of the package: Chart.yaml

* One or more templates, which contain Kubernetes manifest files


Helm charts have values file with the tags of the version numbers which have to be changed if you want to build a different version number.

## Commands

* When a helm release has already been launched, it does not need doing again. Instead see all the launched releases with:
  helm ls —all

* `helm ls -q | xargs helm del —purge`
  Deletes all Helm releases.

* `kubectl get deploy,pods,svc,ingress`


* The following command indicates that the tiller-deploy deployment is available:

```bahrc
kubectl get deployment tiller-deploy --namespace kube-system
```

### Rebuild after local src code change

```
# Delete the helm releases that we have changed:
helm list
helm delete —purge <release_name>

# Rebuild the images:
build… not sure the exact command
./build-docker-images.sh 1.0.0 To run a script that does all the building for you.

#Re-install helm releases:
helm install <release_name>
```

If you get a message saying that there are incompatible versions of helm:
`helm init --upgrade`

### Delete pods

* `helm delete --purge $(helm list | awk '{print $1}' | tail -5)`
  Gets all the helm pods and deletes them
