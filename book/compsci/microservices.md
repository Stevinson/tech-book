# Advanced Microservices: A Hands on Approach

## Chapter 1: General

Benefits:

1. Forced separation of concerns
1. Natural team ownership
1. Frequent deployments
1. heterogeneous selection of programming languages

## Chapter 2: HTTP API Design

## Chapter 3:

## Chapter 4: Service discovery

**Service discovery** is the process of taking the name of a service as an input and getting a network location of an instance of that service as an output. There are two possibilities: client-side and server-side. Depending on where the complexity lies, one should use the alternative method.

This is required due to the fundamental structure of microservice-based applications. In monolithic applications, services invoke one another through language-specific method calls. In a traditional distributed system deployment, services run at fixed, well known locations (hosts and ports) and so can call one another using HTTP/REST. However, microservice-based applications run in either a virtualised or containerised environments in which the number of instances of a service and their locations change dynamically.

Steps:

* A client obtains the location of a service by querying a service registry, which knows all the locations of all the services.

Whilst there are some simple examples of how to build your own discovery server in the book, this is never recommended in practice. A real-world discovery service is **Consul**. This supports both client- and server-side discovery. **Apache Zookeeper** is a tool that keeps track of distributed configuration data. By itself it is not a complete service discovery tool, but one can be made when combined with **Apache Curator** (a layer that sits on top of Zookeeper). This later approach provides client-side discovery. **Netflix Eureka** makes use of client-side routing. Requests are routed round-robin style. It mostly caters to organisations hosted on AWS. Services are required to send Eureka periodic heartbeats. **Ectd** is a tool for distributing key/value data and making this data accessible and consistent. Again, it does not provide service discovery out the box but does have client libraries in many languages, and as such is used as a component of much larger systems.

**Load balancers** are the original tool for providing service discovery. They are essentially a proxy that are aware of multiple service providers.

## Chapter 5: Service State

The database should be so far out of reach from the consumers that they don't know what type of database you are using. If this information does become available, even through some error, then leaky abstraction is said to have occurred.

There are several types of database that are useful in different scenarios:

### PostgreSQL

* PostgreSQL is suitable when data stability, transactions, and the ability to work with different types of related data are important.

* PostgreSQL should not be used when your data schema is highly volatile and constantly changing.

* Also, if you do not need to use complex queries, but rather you only grab the data by means of an identifier, then there are simpler solutions out there.

```
$ mkdir -p ∼/data/postgres
$ docker run \
    --name my-postgres \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=hunter12  \
    -e POSTGRES_USER=zoouser \
    -e POSTGRES_DB=zoodb \
    -v ∼/data/postgres:/var/lib/postgresql/data \
    -d postgres
```

The RETURNING statement is useful in PostgreSQL; by using it, along with a list of columns, you can get the data of INSERT, UPDATE and DELETE statements that do not normally return row data.

### MongoDB

MongoDB is a database specialising in

### Redis

At its heart **Redis** is an in-memory key/value store.

Redis supports two different formats for persisting data on disk:

1. **RDB**, which represents a complete snapshot of all the data in Redis in its simplest form. This is relatively expensive to generate.
2. **AOF**, which contains a lost of commands required to regenerate the state of Redis.

Being an in-memory key/ value storage it is the perfect tool for performing caching, so that data that is 'expensive' does not need to be generated multiple times. Again there are two different categories of caching in Redis:

1. A **LRU** cache is a generic name for something that holds data and keeps track of the last time each piece of data has been accessed. When one of these caches starts to go over the limit, it will start removing entries that haven't recently been touched. To configure Redis LRU caching:

```
maxmemory 512mb
maxmemory-policy volatile-ttl
```
 It is accompanies by a maxmemory-policy, which descries the behaviour for evicting keys from memory. These include:

  1. noeviction
  1. allkeys-lru
  1. allkeys-random
  1. volatile-lru
  1. volatile-random
  1. volatile-ttl

### Elasticsearch

Elasticsearch is a database that is specifically designed to be used for searching for data based on "loose" criteria. Under the hood ES is a document storage database that stores objects that can be represented as JSON. As such, it is common not to use ES as a primary data store but rather to store data required for performing search queries.


---


## Chapter 6: Consumers

The main things to keep in mind when considering consumers are:

* Who they are. This is done by looking at a user agent or performing authentication.

* You need to keep track of which version of endpoints consumers are using so that you can deprecate them, or cut off users that are hogging resources of a public API.

### User Agents

Whenever a request enters your service, it should contain a **user agent**, which is a string used to represent the client making the request. Whilst these are normally created using a generic library, your must ensure that they are meaningful, so that when they are used in your logs and communications that they have meaning.

### API Versioning

The easiest means of doing this is to add a URL segment between the root location and the specific endpoint.


---


## 12 Factor Apps

## Twelve Factor Apps

#### Bookinfo follows the twelve factors

###### Codebase

###### Dependencies

* All dependencies are explicitely declared in the file.

###### Config

* **Environment variables**

###### Backing Services

* No distinction made between third party and local services, which Bookinfo doesn't - it just asks for a url.

###### Build, Release, Run

* Build step, release step and code in a Github repo.

###### Port Binding

* "**A twelve-factor app is completely self-contained** and does not rely on runtime injection of a webserver into the execution environment to create a web-facing service. The web app **exports HTTP as a service by binding to a port,** and listening to requests coming in on that port." In dev this is localhost, whilst in deployment a routing layer handles requests from a public-facing hostname to the port-bound web processes. "This is implemented by using dependency declaration to add a webserver library to the app, such as Tornado for Python, Thin for Ruby, or Jetty for Java."

###### Concurrency

* Bookinfo scales via pods. Microservices are concurrent processes.

###### Disposability

- It runs in containers (via kubernetes). Each microservice is a pod, and kubernetes' container functionality will spin up another if one goes down.

###### Dev/ prod parity

* The developers who wrote code are closely involved in deploying it and watching its behaviour in production.
* Development and production are kept as similar as possible. For example, the same
* Time between deploys can be kept to hours, not weeks.



#### Where Bookinfo does not follow the twelve factors

###### Logs

* There is no logging in the basic Bookinfo, but with Istio there is.

###### Process

* "**Twelve-factor processes are stateless and share-nothing**. Any data that needs to persist must be stored in a stateful backing service" - Bookinfo does not do this, it stores it statically."

###### Admin

* "**Twelve-factor strongly favours languages which provide a REPL (Read-Eval-Print Loop) out of the box**. "


---

## Containers and Microservices

(These notes are taken from [this](https://www.ibm.com/developerworks/cloud/library/cl-bluemix-microservices-in-action-part-2-trs/cl-bluemix-microservices-in-action-part-2-trs-pdf.pdf) tutorial)

Microservices revolve around scaling out instead of scaling up - i.e. instead of adding more RAM to a microservice runtime, we simply get another microservice runtime of the same kind. This leads to the need to manage a multitude of services.

Another underlying concept is that when a service has been deployed, they cannot be changed.


---


## Microservices and WAS Liberty

https://developer.ibm.com/wasdev/docs/microservices/#context

### Using JWTs to secure Microservices

A single request from a client can lead to multiple requests between the multiple independently deployable services that comprise an app, and these communications should be kept secure: you want to know that any given request is being handled by any given service originated from a known user.

* [Authenticating microservices using JWTs](https://developer.ibm.com/wasdev/docs/using-signed-json-web-tokens-jwts-secure-microservices/)

* [Secure microservices with API keys](https://developer.ibm.com/wasdev/docs/using-api-keys-secure-microservice/)

* [JWT Github example](https://github.com/WASdev/sample.microservices.security.jwt)

* [Liberty example code](https://developer.ibm.com/wasdev/getstarted/)

* [Liberty 12 factor tutorial](https://github.com/WASdev/sample.microservices.12factorapp)

A **JSON Web Token JWT** is a like a small document stating who the user was, when the request was made, and possibly other information such as what the request was for. Once identity is established, signed JWTs can be used to pass on that identity to other microservice invocations. Each consumer of the token is able to verify that they can trust the claims made by it, by verifying that they trust the signature of the token. Once a consumer verifies the signature, theu know the content of the token has not been altered after it was signed by the person they trust.



---


## API gateway model

In displaying a single-page, an app may need to interact with several different microservices. If the client talks to each of the microservices directly then every time a microservice was refactored then updates would need pushing to all the devices that use the client. The **API gateway pattern** addresses this; it acts a front controller - a single logical point of entry into the application.


---



## Liberty microservices

### Steps when building a microservice from scratch

#### Auto generate microservice using IBM Microservice Builder

```bashrc
bx login
bx dev create // creates the artifacts, dockerfile, helm chart, jenkinsfile
bx dev build
bx dev run // can access at  http://localhost:9080/[project]/v1/example

// Create an overrides.yaml at chart/overrides.yaml

minikube start
minikube docker-env
docker build [appname]
helm install chart/[appname]

// create configmap.yaml in chart/webapp/templates
```

#### Manually generate the parts needed for a Java, Liberty Microservice

##### General

1. readme
1. `.gitignore`

##### Charts

```bashrc
mkdir chart
mkdir webapp
mkdir templates
// copy templates directory
// copy .helmignore file into chart directory
touch Chart.yaml // into webapp directory
touch values.yaml // fill with values for templates
```

##### Liberty

1. Create a 'dynamic web project' and hook it up to WAS
1. Create a new maven project, which creates things like the `pom.xml`

###### Security

1. Under the server tab click on server configuration
1. Add webSecurity2.0 to the feature management
1. Add basic user registry to the server configuration box on the left

####### web.xml

To create a stub for the web.xml (or deployment descriptor) then right-click on the project name > Java EE tools > deployment descriptor stub

* `<security-constraint`
* `<login-config>`
* `<servlet>`
* `<servlet-name>`

##### Docker

1. Dockerfile and a .dockerignore

##### Java

1.

##### Set up Database

```bashrc
docker pull mysql/mysql-server:latest
docker run --name=mysql01 -d mysql/mysql-server:latest
docker logs mysql01 # Copy the temporary password
docker exec -it mysql01 mysql -uroot -p # Log into the container
ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpassword'; # Change the password
```
