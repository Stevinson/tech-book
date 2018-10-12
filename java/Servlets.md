# Java Servlets

A Java servlet is a Java program that extends the capabilities of a server. They most commonly implement applications hosted on Web servers. Such Web servlets are the Java counterpart to other dynamic Web content technologies such as PHP and ASP.NET.

A Java servlet processes or stores a Java class in Java EE that conforms to the Java Servlet API.

Servlets act as a middle layer between requests coming from a web browser and databases or applications on the HTTP server. They allow you to collect input from users (such as from forms) and create web pages dynamically. They often serve the same purpose as programs implemented using the CGI but are platform independent and have better performance.

## Servlet Tasks

Servlets perform the following tasks:

* Read the data from clients.

* Read the HTTP request data.

* Process this data and generate results.

* Send the data back to the client.

## JavaServer Pages

Servlets can be generated automatically from **JavaServer Pages (JSP)**. JSPs helps create dynamically generated web pages based on html.

It allows Java code and certain pre-defined actions to be embedded into static content. It does this by adding XML-like tags, called JSP actions, to be used to invoke built-in functionality.

JSPs are compiled into Java Servlets by a JSP compiler. To deploy and run JSP, a compatible web server with a servlet container, such as **Tomcat** or **Jetty**.

## Deploying Servlets

To deploy and run a servlet a web container must be used. A web container is essentially the component of a web server that interacts with the servlets.

## Servlet Packages

Java servlets are Java classes that are run by a web server that has an interpreter that supports the Java Servlet specification.  Servlets can be create using the `java.serlet` and `javax.servlet.http` packages.
