# Productionise

A good production environment can answer all of these questions:

* How do I log the inputs and outputs of my service?
* How do I monitor if the service is operating normally?
* How do I guarantee my service is secure?
* Can my service handle the anticipated capacity at all times?
* Can I scale the my service if I need to handle more capacity?
* How will I test my service?
* How will I deploy my service?
* Does my service need to be up all the time? What happens if it is down?
* How does my service operate with other systems?
* How performant is my service and how do I measure it?
* How reliable is my service?

## MLOps to scale your production machine learning (Alejandro talk)

Video can be found [here](https://www.youtube.com/watch?v=Ynb6X0KZKxY)

Github link found [here](https://github.com/EthicalML/awesome-production-machine-learning#model-serving-and-monitoring)

The talk covers three of the repo's eight principles: reproducibility, model orchestration and explainability.

Reproducibility:

* Model and data versioning
* Abstracting individual steps in the pipelines
* e.g. DVC, Pachyderm, 

Model Orchestration:

* i.e. computational resource allocation
* Services with different computational requirements with often complex computational graphs need to be allocated the right resources
* e.g. Algorithmia, Seldon, MLeapDeepDetect

Explainability:

* Tackling 'black box' situations
* Explaining through tools, process and domain expertise
* Data assessment: class imbalances, correlations, data representability
* Model assessment: feature importance, model specific methods
* Production monitoring: evaluation of metrics, anomaly monitoring, setting thresholds for divergence
* e.g. ELI5, SHAP, XAI