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


---

## Django Security

### XSS

Django templates protect against a lot of XSS attacks as they escape many of the harmful characters to an html file. 

### Injection

Django querysets are constructed using query parameterisation which are escaped by an underlying database driver.

### Clickjacking

*Clickjacking* is a type of attack in which a malicious site wraps another site in a frame which can lead a user to perform unintended actions. Django protects against this with **X-Frame-Options moddleware** which can prevent a site from being rendered inside a frame. 

### SSL

To enable SSL  


---


## OWASP Secure Coding Practices

The focus of attackers has steadily moved towards the application layer, with 60% of attack attempts in 2009 being against web applications.

Security requirements and abuse cases need to be added into the early stages of the software lifecycle.



## OWASP Top 10 Web App Security Flaws

### 1. Injection

Injection flaws occur when an attacker can send hostile data to an interpreter. Injection vulnerabilities are often found in SQL, LDAP, XPath, OS commands, XML parsers, and many more.

To prevent all user-supplied data must be validated, filtered and sanitised. This can be achieved by using a parameterised interface to the interpreter, escaping special characters and using LIMIT so that mass disclosure of records is not possible.

### 2. Broken Authentication

Threat agents include common username/ password combinations for credential stuffing, default admin account lists and session management attacks.

Prevention revolves around the confirmation of a user's identity, authentication and session management. This can be achieved through multi-factor authentication, session ID rotation/invalidation and effective credential recovery processes.

### 3. Sensitive Data Exposure

Manual attacks such as stealing keys, man-in-the-middle attacks and taking clear text data from the server fall into this category. 

Means of prevention:

* All sensitive data must be encrypted and strong key generation and management processes used. 

* The user agent (e.g. app, mail client) must verify that the received server certificate is valid.

* Discard sensitive data as asoon as possible.

* Encrypt all sensitive data in transit using secure protocols such as TLS with perfect forward security (PFS) ciphers. PFS gives assurances that session keys will not be compromised even if the private key of the server if compromised. It protects past sessions against future compromises of secret keys.

* Disable caching for responses that contain sensitive data.

* Use strong adaptive and salted hashing functions with a delay factor, such as Argon2, scrypt, bcrypt or PBKDF2. NB. a salt is random data that is concatenated with the sensitive data before hashing. 

### 4. XML External Entities

Many older XML processors have vulnerabilies that can be exploited. 

Mitigatio nmeasures include: Whenever possible use loss complex data structures such as JSON, patching and upgrading all XML processors, server-side input validation.

### 5. Broken Access Control

Access control enforces policy such that users cannot acty outside of their intended permissions.

Whilst SAST and DAST can detect the absence of access control it cannot verify if it is functional when it is present.

Access control circumvention normally occurs if attackers can bypass the control checks by modifying the url or the html page, elevation of privelege, manipulation of a JWT or cookie. 

Risks can be mitigated by invalidating JWTs upon logout. Access control is only effective if enforced in a trusted server-side code where the attacker cannot modify the control check or metadata.

### 6. Security Misconfiguration

Common problems include:

* Default accounts/passwords still enabled.

* Error handling reveals stack traces that are overly informative.

A repeatable hardening process should be implemented in which QA, dev and production environments are configured in the same manner. Extraneous features and components should be removed. 

### 7. Cross-Site Scripting

XSS is found in two-thirds of all applications and is found in three forms:

1. Reflected XSS: the application includes unvalidated user input  as part of the html output.

2. Stored XSS: The app stores unsanitised user input that is viewed at a later date by an admin.

3. DOM XSS: JavaScript frameworks that dynamically include attacker-controllable data.

There must exist a separation of untrusted data from active browser content. This can be achieved by automatically escaping untrusted HTTP request data based on the context in the html output.

### 8. Insecure Deserialiation

Applications are vulnerable if they deserialise hostile objects supplied by an attacker. This is done via two main types of attack:

1. Object and data structure related attacks where the attacker modifies application logic or achieves arbitraey remote code execution.

2. Typical data tampering attacks, such as access-control-related attacks, where existing data structures are used but the content is changed. 

Do not accept serialised objects from untrusted sources or use serialisation mediums that only use primitive types. If this is not possible then one could use integrity checks on any serialised objects. Or deserialise in low privelege environments.

### 9. Using Components with Known Vulnerabilities

Component-heavy development patterns can lead to teams not appreciating which components they use and/or their vulnerabilities.

One needs to subscribe to security bulletins for all the components you use and respond to any flagged issues in a timely manner. Furthermore a patch management system should be set up to remove unused dependencies, unnecessary files. Finally, you lshould only obtain components from official sources over secure links.

### 10. Insufficient Logging and Monitoring

Attackers rely on the lack of monitoring and timely response to achieve their goals without being detected. During penetration testing the logs should be analysed and deemed to have recorded sufficiently the damages inflicted. As most attacks begin with vulnerability probing, allowing such probes to continue can raise the likelihood of a successful exploit to nearly 100%. 

Things that need to be logged: all login, access control failures, server-side validation failures with sufficient user context to identify suspicious behaviour, all held for long enough to allow delayed forensic analysis and in a format that can be easily consumed by a centralised log management system.


## TODO: Research
---

1. FoxyProxy
2. Burp Suite
3. wfuzz
4. nmap -sC -sV -oA
5. hydra
6. {echo,text} or ${IFS} to get around not being allowed spaces
7.stty
8. sysmonitor
9. rock you
10. find -newermt to specify a time to look for
11. base64 as compiled python files can be converted to python files using program called uncompyle
12. linpeas
