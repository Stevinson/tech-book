# Security

## Attacks

### Cross-Origin Resource Sharing (CORS)

#### Definition

This allows restricted resources on a web page to be requested from another domain outside the domain from which the first resource was shared. CORS defines a way in which a browser and server can interact to determine whether or not it is safe to allow the cross-origin request.

It describes new HTTP headers to request remote URLs only when they have permission.

### CRDF

**Cross-Site Request Forgery** is an attack that forces an end user to execute unwanted actions on a web application in which they're currently authenticated.

### Same Origin Policy

A browser keeps a cookie that keeps a user authenticated to a site. Even when you leave that site a potential attacker can use this to gain access. However, the origin of the request will be different and so a **same origin policy** can be implemented to ensure that



----


## Defense

### Secure Sockets Layer (SSL)

**Transport Layer Security (TLS)** and SSL are cryptographic protocols that provide communications security over a computer network.

The TLS protocol comprises of two layers: the **TLS record** and the **TLS handshake**.

Note the difference between client and user certificates:


### Client Certificate Authentication

A **client digital certificate** is a file that is loaded onto a client application that contains pertinent information such as a digital signature, certificate authority, etc. At the start of a SSL or TLS session the server may require the client application to submit a client certificate for authentication.

Client certificates are used less frequently as they have to be installed on client applications, which is tedious for admins and less user friendly.

Steps:

1. Client introduces itself to the server, getting a set of security-related information.

2. Server responds with a server certificate.

3. If the server is configured, the client certificate authentication is initiated.


### Server Certificates

CA certificates are the certificates that a browser has that can be used to verify the digital signature found on the server's certificate. On these certificates is a copy of the public key of the **Certificate Authority (CA)** who might issue/sign your server certificate.

1. Getting a certification signed by a CA

The process is started by generating a private/ public key pair, followed by a **certificate signing request (CSR)**

2. SSL handshake

Process in which the browser uses the public key of a CA to authenticate.


#### Managing Client Certificates


A **keystore** is a repository where private keys, certificates and symmetric keys are stored. It normally takes the form of a file.

##### Self-signed Certificates

1. Inspect with the `keytool` commands.

`keytool -list -v -keystore path_to_keystore_file # Check if the keystore file exists`

2. Use the `securityUtility` command line tool to create the certificate.

`securityUtility createSSLCertificate --server=server_name --password=your_password`

OR

`keytool -genkeypair -alias <alias> -keyalg RSA -keysize 2048 -keystore /Users/edwardstevinson/RTC-trunk/Projects/Deployment/build/toolkit/configuration/security`

3. (opt) Get the certificate signed by a CA.

4. Export the certificate to a certificate file, with the extension .cert.

`keytool -export -alias alias_name -keystore path_to_keystore_file -rfc -file path_to_certificate_file`

Generates a key pair (a public key associated with a private key). It wraps the public key in an X.509 v3 self-signed certificate, which is stored as a single-element certificate chain. The certificate chain and private key are stored in a new keystore entry identified by an alias. It takes the following arguments:
  * `keyalg`
  * `dname`
  * `keypass`

5. Install the certificate on the client.

Chrome: Go to chrome://settings and click on manage certificates.

Windows: Use certmgr to look at trusted certificates.

6. Create a **truststore** on the server.


#### Types of certificate

.pem, .cer and .der are all file extensions for files that usually contain a X.509 v3 certificate.

DER is the method of encoding the data that makes up the certificate. DER itself could represent any kind of data, but usually it describes an encoded certificate or a CMS container. The structure of a certificate is described using the ASN.1 data representation language. BER and DER are binary encoding methods for data described by ASN.1.

PEM is a method of encoding binary data as a string (ASCII armor). It contains a header and a footer line (specifying the type of data that is encoded and showing begin/end if the data is chained together) and the data in the middle is the base 64 data. In the case that it encodes a certificate it would simply contain the base 64 encoding of the DER certificate. PEM stands for Privacy Enhanced Mail; mail cannot contain unencoded binary values such as DER.

.cer just stands for certificate. It is normally DER encoded data, but Windows may also accept PEM encoded data. You need to take a look at the content (e.g. using the file utility on posix systems) to see what is within the file to be 100% sure.

**.p12 includes the private key whilst the .der file does not**

##### OpenSSL Certificates


### OAuth

**OAuth** is an open standard for the access delegation - used as a way to give applications access to a user's information without giving them the password. It provides *secure delegated access*.  It is designed to work specifically with HTTP. It allows access tokens to be issued to third-party clients by an authorisation server. The third party then uses the access token to access the protected resources hosted by the resource server. OAuth defines four roles:

* Resource owner - the end-user
* Resource server - the protected asset
* Client - the application that needs to obtain a token in order to access the resource server. Complexity is shifted to the auth server meaning that the client-side logic is simple.
* Authorisation server - dedicated server for issuing the access tokens to the client, after successfully authenticating the end-user and making sure the requested access can be granted, by obtaining consent from the end-user, by applying a policy , or some other mean.

A client provides a valid **grant** in order to obtain an **access token**. There are many types of grant; the correct one to use is dependent on the type of client in use. Click (here)[https://connect2id.com/learn/oauth-2] for a full list but includes authorisation codes, implicit, password, client credentials, etc.

The process is as follows:

1. The client initiates the code flow by redirecting the browser to the authentication server with an authorisation request.

2. At the authorisation server the user will be authenticated by checking if they have a valid session (established by a browser cookie)


TODO: Finish. See link above.


### Encoding Passwords

```
securityUtility encode <password>
```

Use the above to encode a string password.



NB. securityUtility is in i2Analyze/wlp/binary
NB. On windows keytool is lcoated at
NB. gskcmd is not on mac
NB. /Users/edwardstevinson/RTC/ProjectX_Server/Build/Fetched/Tools/Java/jre/bin is the location of ikeyman on mac
NB keytool is at C:\Users\Ed\Desktop\i2\Initial setup\DB2\ibm_datastudio4120_win\disk1\InstallerImage_win64\jre_6.0.0.sr9_20110208_03\jre\bin on my windows box


## AppScan

AppScan is intended to test web applications for security vulnerabilities during the development stage, when it is least expensive to fix such problems.
