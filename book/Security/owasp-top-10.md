# Security

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



