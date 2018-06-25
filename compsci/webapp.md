# Java Dynamic Web Apps

## Requests

The pattern that we use for our web services:

* Class for a client request.

* Class for a server response.

* A response builder for populating the response.

* A request handler which **processes** the info in the request, such as translating a client id to a server id.

## Servlets

Web servers are good for static content but they don't know how to generate dynamic content or save to databases. Java Servlet and JSPs are server side technologies to extent the capability of web servers by providing support for dynamic response and data persistence.

To create HTML use the following class:

```Java
HttpServletResponse
```

## JSPs

A **JSP** is a view technology which provides template to write plain vanilla HTML/CSS/JS in and provides the ability to interact with the backend Java code.

## Security

See (here)[https://www.redbooks.ibm.com/redbooks/pdfs/sg248076.pdf].

## Deployment Descriptor (web.xml)

Google documentation on the parts of the `web.xml` can be found (here)[https://cloud.google.com/appengine/docs/standard/java/config/webxml].

Inside Eclipse we store files used for the development of the web application within a project folder. The files within the project are used for building the web application and are not necessarily used as a deployable unit of work. We will keep the folders and files that comprise a deployable instance of the web application in a folder called web, which is stored within the project.

Every Java Web application has a deployment descriptor that is located at WEB-INF/web.xml, relative to the root of the deployable folder. Because we store all deployable objects under a folder called web, this deployment descriptor will be located at web/WEB-INF/web.xml.

The web.xml file configures several aspects of the Web application, the most important information being the servlets and the url-patterns that lead to their invocation.

We will initially create a single servlet and have it invoked when the URL requested by the browser matches the url-pattern /home. To configure this, do the following.

Expand the web folder.
Right-click on the WEB-INF folder and select New ... File.
Specify a name of web.xml and click the OK button.
In the text editor window that appears for web.xml, insert the contents of the following code listing, and save the file.
If you can not edit the web.xml file in the window that Eclipse provides, it is because Eclipse is using the XML editor to provide access to the file. Close this window and right click on web.xml in the Project Explorer view and select Open With ... Text Editor.

Deployment Descriptor web.xml
<?xml version="1.0"?>
<web-app
     xmlns="http://java.sun.com/xml/ns/j2ee"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee
        http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd"
     version="2.4">
   <servlet>
      <servlet-name>home</servlet-name>
      <servlet-class>website.web.HomeServlet</servlet-class>
   </servlet>
   <servlet-mapping>
      <servlet-name>home</servlet-name>
      <url-pattern>/home</url-pattern>
   </servlet-mapping>
</web-app>
Note: make sure there is no leading space in the web.xml file. In other words, the file should start with <?xml version="1.0"?> without any space before the left angle bracket.

The url-pattern /home is relative to the context path that identifies the website Web application. Although we haven't specified this yet, the context path will be /website. This means, for a browser to invoke the home servlet, it must request the following URL.

http://localhost:8080/website/home
The deployment descriptor can be used to tell tomcat many things. However, the most basic information provided in a deployment descriptor are the servlets and their associated url patterns. For each servlet in your web application, there should be a servlet element, such as the following.

   <servlet>
      <servlet-name>home</servlet-name>
      <servlet-class>website.web.HomeServlet</servlet-class>
   </servlet>
The above servlet element tells the web container to create an instance of website.web.HomeServlet and call that instance by the name home. Although it is possible to create additional instances of HomeServlet, normally a single instance is made.

In addition to creating servlet instances, the web container should associate url patterns with these instances, so that when the web container receives an HTTP request from a web browser, it can determine which servlet to use to process the request. The following servlet-mapping element in our deployment descriptor tells tomcat that all incoming requests for home should be processed by the servlet instance with name home.

   <servlet-mapping>
      <servlet-name>home</servlet-name>
      <url-pattern>/home</url-pattern>
   </servlet-mapping>
Multiple servlet-mapping elements can be used to associate any number of url patterns with a single servlet instance.


### Manifest file

`manifest.yml`

A single manifest file deploys all the microservices. It controls the deployment of the microservices and allows us to pass additional environment variable as needed.


## Implementation

### Liberty microservices

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

##### Charts (helm)

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

See [here](https://www.redbooks.ibm.com/redbooks/pdfs/sg248076.pdf).

1. Under the server tab click on server configuration
1. Add appSecurity2.0 to the feature management
1. Add basic user registry to the server configuration box on the left
1. Add users and groups
1. Create a web.xml (see below)
1. Add the following, which creates a autherisation constraint in the web.xml:
```xml
<security-constraint>
  <web-resource-collection>
    <web-resource-name>Secured HTML Resources</web-resource-name>
    <url-pattern>/*</url-pattern>
  </web-resource-collection>
  <auth-constraint>
    <role-name>AuthenticatedUser</role-name>
  </auth-constraint>
</security-constraint>

<login-config>
  <auth-method>FORM</auth-method>
  <realm-name>Form-Based Authentication Area</realm-name>
  <form-login-config>
    <form-login-page>/login.html</form-login-page>
    <form-error-page>/loginError.html</form-error-page>
  </form-login-config>
</login-config>
```
1. Now need to bind the application and the server. server.xml>application>add>application binding>add>security role>name then add>group>name to match the group created earlier

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

##### Create gradle

NB. Ensure gradle is installed with `brew install gradle`.

1. Run init

```
gradle init --type java-application // Generate all the defaults

./gradlew build // The report from this can be found at build/reports/tests/test/index.html

./gradlew tasks
./gradlew run
```

##### Attach mysql db

```
docker run --name db -d -e MYSQL_ROOT_PASSWORD=123 -p 3306:3306 mysql:latest

mysql -uroot -p123
docker exec -it db /bin/bash
```

The java steps are as follows:

1. Create a Java Connection to the MySQL database
1. Define the SELECT statement
1. Execute the SELECT query, getting a Java ResultSet from that query
1. Iterate over the ResultSet, getting the database fields (columns) from each row of data that is returned
1. Close the Java database connection
1. Catch any SQL exceptions that may come up during the process
