# How to create a new gradle project

1. First we create a gradle project: `$ gradle init --type java-library`

2. Then we format it to a Liberty server:

  * Create a web.xml: `touch src/webap/WEB-INF/web.xml`
  * Create a server.xml: `touch src/main/liberty/config.server.xml`

3. Fill the `build.gradle`, this cis comprised of the following sections:

  * apply the plugins required
  * version details, e.g. `version: '1.0-SNAPSHOT'`
  * `buildscript` to state the plugins required
  * `repositories` - where to find the dependencies
  * `dependencies` - the java code required for compilation
  * `ext` - variables
  * `war`
  * `test`



4. Connect to IBM Cloud

  * Create a `manifest.yml` file in the project's root directory. A basic example is as follows:

  ```
  applications:
  3  - name: GetStartedJava
  4    random-route: true
  5    path: target/GetStartedJava.war
  6    memory: 256M
  7    instances: 1
  ```

  * log in
  * `bx target --cf`
  * `bx cf push` from within the root directory


TODO:

* Set up pipeline of testing

* Set up local minikube

* Set up IBM cloud so online

* Add redis to cache db stuff

* Docker images

* kubernetes

* helm

* refactor out front end into microservice
