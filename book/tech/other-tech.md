# Other tech

* **UnionFS** is used to stack Docker images, allowing each image's file system to be merged, forming a cohesive system.

* Kubernetes uses **Etcd** to provide services discovery.

* **Crontab syntax**. Cron is a time-based job scheduler in Unix-like OSs. it is driven by a crontab file, which specifies shell commands to run periodically on a given schedule. The crontab files are stores where the lists of jobs and other instructions to the cron daemon are kept.

* **Apache Mesos** "abstracts CPU, memory, stprage, and other compute resources away from machines, enabling fault-tolerant and elastic distributed systems to be easily built and run effectively". It is used to manage and scale containers. It is usually used alongside a framework that is used to actually decide which services nned to run within Mesos. One of these is **Mesosphere**.

* Other Ci tools include **TeamCity**, which is a paid-solution for handling software building and is similar to Jenkins. **CircleCI** is another CI SaaS tool that is coupled tightly with Github.

* **ChaosMonkey** (created by Netflix) randomly kills services in a system. The effect of killing services is that it forces developers to naturally build fault-tolerant systems.

* **Consul** is a discovery service.

**Apache Zookeeper** is a tool that keeps track of distributed configuration data. By itself it is not a complete service discovery tool, but one can be made when combined with **Apache Curator** (a layer that sits on top of Zookeeper). This later approach provides client-side discovery.

* **Netflix Eureka** makes use of client-side routing. Requests are routed round-robin style. It mostly caters to organisations hosted on AWS. Services are required to send Eureka periodic heartbeats.

* **Ectd** is a tool for distributing key/value data and making this data accessible and consistent. Again, it does not provide service discovery out the box but does have client libraries in many languages, and as such is used as a component of much larger systems.

* At its heart **Redis** is an in-memory key/value store.

* We use Jackson as a suite of JSON parsing/ generator tools.

* **JAX-RS** is a Java API that provides support in creating web services according to the Representational State Transfer architectural pattern (REST).

* Solr is built on **Apache Lucene**, which is a Java-based retrieval library.


* **ASP.NET** is a server-side web application framework designed for web development to produce dynamic web pages.

* **Java EE** (Java Platform, Enterprise Edition) extends the Java Platform, Standard Edition, providing an API for object-relational maping, distributed and multitier architectures, and web servers.

* **Redis** is a in-memory database project implementing a networked, in-memory key-value store wuth optional durability.

* **Key-value** database is a data storage paradigm designed for managing **associative arrays** (more commonly known as dictionaries or hashes). **Dictionaries** are collections of objects, which themselves have fields. They differ from relational databases in that RDBs pre-define the schema.

* A **NoSQL** database

* **Apache Lucene** is a free and open-source information retrieval software library,

* **Kryo** is used for fast and efficient object graph serialisation in Java. We use it to implement our method of storing data as immutables and just refering to it be reference (IDs). To edit data we look up the ID and copy using Kryo, whilst create is a case of cloning as we don't have an ID yet.

* **Maven**

Maven is a build automation tool used for Java projects. It deals with how the software is built and also describes the dependencies.

## `pom.xml`

The `pom.xml` file has all the information to build a project. It contains the majority of the information required to build a project.

The `pom.xml` can be generated through Eclipse by using the m2e plugin. The steps to follow are:

1. File > New > Project
2. Maven > Maven Project > Next
3. "Create a simple project"
4. Add information such as Group ID, Artifact ID, Packaging = jar and a name
5. Finish the wizard
6. Can build by selecting the project and then from the context menu clicking Run as > Maven install

* We currently use **MapDB**. This uses two trees: H-trees and B-trees. One is good if you know the data is going to be where you say it is and as such is optimised for fetching the data, whilst the other is optimised for performing lookups.

* When we move away from transaction synchronicity we will use another tech like **GraphDB**. There is also something called **Apache TinkerPop**. Another is **Gremlin API**. Transaction synchronicity assures the completion of requests but is costly and when you need performance you will have to start doing things asynchronously.

* **Haskell**

 Functional language.

 * **Esri (Environmental Systems Research Institute)** is an international supplier of geographic information system software.

 * **React** is a JS library for building user interfaces. It can be used in the development of single page applications.

 * **Typescript** is an open-source language developed by Microsoft that is a superset of Javascript. It adds optional static typing to the language.

 * **JFrog Artifactory** is a universal repository manager.

* **nginx** is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.

* **jq** is a lightweight and flexible command-line processor for JSON.

* **swig** (simplified wrapper and integration generator) is a tool that conmnects programs written in C and C++ with a variety of high-level programming languages.

* **Spong** is a **moreutils** utility that soaks up standard input to json
