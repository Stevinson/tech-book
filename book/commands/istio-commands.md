# Istio

Istio allows you to:

1. Perform traffic management via .yaml files
2. Use **Grafana** to provide visualisations of metrics
3. Create a service graph to view the interdependencies of your project

## Commands

* Istio is deployed as a series of pods within your Kubernetes cluster.

```
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm install --name devcamp incubator/istio
```

* Use `istioctl` for all istio command line commands

    echo "http://"$(kubectl get po -l istio=devcamp-istio-ingress -o 'jsonpath={.items[0].status.hostIP}'):$(kubectl get svc istio-ingress -o 'jsonpath={.spec.ports[0].nodePort}')"/api-v1/productpage"

Get the url of a Kubernetes app

- http://127.0.0.1:3000/dashboard/db/istio-dashboard
  The url of the Grafana dashboard.
-     ./istio/portForwardServiceGraph.sh
