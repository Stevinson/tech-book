# Django Security

## XSS

Django templates protect against a lot of XSS attacks as they escape many of the harmful characters to an html file. 

## Injection

Django querysets are constructed using query parameterisation which are escaped by an underlying database driver.

## Clickjacking

*Clickjacking* is a type of attack in which a malicious site wraps another site in a frame which can lead a user to perform unintended actions. Django protects against this with **X-Frame-Options moddleware** which can prevent a site from being rendered inside a frame. 

## SSL

To enable SSL  
