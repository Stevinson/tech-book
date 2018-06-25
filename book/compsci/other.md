# Other

## Programming

###

#### Transactional Model

Transaction processing is information processing that is divided into individual, indivisible operations called **transactions**. Each transaction must succeed or fail and can never be partially complete.

#### Cache Invalidation

Cache invalidation is when entries in a cache are replaced or removed.

#### Strong Identifiers

An identifier refers to the name given to entities such as variables, functions, and structures. They must be unique as they are used to identify the entity during the execution of a program.

#### Canonical Path

A canonical path is a unique path that allows comparison between paths. It is normally the shortest absolute path (shortest in terms of string-length). A canonical ath will resolve any aliases, shortcuts or symbolic links that lie on the path into the actual directories to which they refer.

#### Providers

Providers are used to inject objects of smaller scope into a larger scoped bean. Injecting `Provider<T>` instead of merely `T` allows one to:

1. Retrieve multiple instances

Having `Provider<T>` instead of just `T` allows you to access multiple instances, each of which you can safely mutate and discard.

2. Lazy retrieval of an instance

3. Break circular dependencies

Providers are used in numerous means by Guice.

TODO: Providers can be used instead of factories. As they do not take arguments, its a means of getting an object. See the code on line 154 of `ChartResourceModule` for an example:

```Java
bind(new TypeLiteral<Predicate<RecordAndMetadata>>() { })
    .to(DeduplicateDataRecordsPredicate.class);
```


#### Lazy Evaluation

This is when you delay the evaluation of an expression until its value is needed.

#### Tuple

In mathematics a tuple is a finite ordered list.

#### Common Gateway Interface (CGI)

Historically, different server software would use different ways to exchange the information required by HTTP for a response to requests (eg. status, content, doc type). As a result it was not possible to write scripts that would work unmodified on different server software, so the CGI standard was established.

#### `.DS_STORE` file

The `.DS_STORE` file (*Desktop Services Store*) contains the custom attributes of its containing folder, such as the position of icons or the choice of background image. It is created and maintained by the finder application. Its equivalent in Windows is the `desktop.ini` file.

#### Imperative and Declarative Programming Languages

Imperative is do this, then do that, then do the next thing and so on. Declarative is, this are the rules, now what's the answer to this question

#### Command Query Responsibility Segregation

"At its heart is the notion that you can use a different model to update information than the model you use to read information. For some situations, this separation can be valuable, but beware that for most systems CQRS adds risky complexity".

TODO

----

### Hardware

When reading data from a file or a disk the processor needs to wait for the file to be read. Problems can arrive around the issue of **access time**, which is the time it takes for a computer to process a data request from the processor and then retrieve the required data from the storage device. Since disk drives are mechanical there is a wait whilst the disk rotates to the required disk sector.

---


### Other

#### Scalable Vector Graphics (SVGs)

SVGs are an xml-based vector image for two-dimensional images and graphics. The benefits of this are:

* This allows the images to be searched, indexed, scripted and compressed.

* They can be created and edited with any text editor.


---



### URIs, URLs and URNs

#### Uniform Resource Identifier

This is just an identifier.

#### Uniform Resource Locator

A URL is a locator as well as an identifier, which means that it contains information that can be used to fetch a resource from its location and that every URL is also a URI. URLs always start with a protocol (e.g. http) and usually contain information such as the network host and often a document path.

#### Unique Resource Name

URNs should be unique across both space and time, and are thus have a stricter uniqueness constraint.



---


## Swap file

Alternatively referred to as a page file or paging file, a swap file is a file on a hard drive that is used as a temporary location to store information not being used by the computer RAM. By using a swap file, a computer can use more memory than what is physically installed in the computer. However, if the computer is low on drive space the computer can run slower because of the inability of the swap file to grow.



---


## Shared Resource

A **shared resource**, or **network share** is a computer resource made available from one host to other hosts on a computer network. It is a device that can be remotely accessed from another computer, typically on a LAN or an enterprise internet, transparently as if it were a resource on the local machine.


---


## localhost


---


## LDAP (Lightweight Directory Access Protocol)

The Lightweight Directory Access Protocol is an open, vendor-neutral, industry standard application protocol for accessing and maintaining distributed directory information services over an Internet Protocol (IP) network.



---


## Single page application

A single-page application (SPA) is a web app that interects with the user by dynamically rewriting the current page rather than loading entirely new pages from a server. The page does not reload at any point, not does control transfer to another page, although a location has can be used to provide the perception of separate logical pages in the app.


---


## Location hashes



___


## Fragment Identifier

A fragment identifier is a short string of characters that refers to a resource that is subordinate to another, primary resource.



---


## Source-to-source compiler / Transpiler

A transpiler is a type of compiler that takes the source code of a program written in one programming language


---


## Tracing

Tracing involves a specialised use of logging to record information about a program's execution, normally for debugging.


---


## Atomic

Making an operation atomic consists of using synchronisation mechanisms in order to make sure that the operation is seen, from any other thread, as a single operation. That means that any other thread will see the value of an atomic assignment either before the assignment or after the assignment, but never in an intermediate state.


---


## Opaque and Transparent data types

In computer science, an opaque data type is a data type whose concrete data structure is not defined in an interface. This enforces information hiding, since its values can only be manipulated by calling subroutines that have access to the missing information. The concrete representation of the type is hidden from its users, and the visible implementation is incomplete. A data type whose representation is visible is called transparent.[1] Opaque data types are frequently used to implement abstract data types.


---


## ASCII

(Here)[http://www.asciitable.com/] is a table of all the ASCII characters.


---


## Regex

(Here)[https://www.rexegg.com/regex-quickstart.html#ref] is a good regex guide.

* `(a|b)` means look for either the letter a or the letter b

* `[^a]` means not a.

* `?` means once or none


---


## UTF-8 and UTF-16

In UTF-8 a character may occupy a minimum of 8 bits whilst in UTF-16 a character starts with 16 bits.

The pros of UTF-8:

1. As all latin characters without accents occupy one byte they are identical to US-ASCII, meaning that all UTF-8 are valid US-ASCII. This provides good backwards compatibility.

2. UTF-8 is independent of byte order, nullifying the big-endian/ little-endian issue.

The cons of UTF-8:

1. Many common characters have different length, which slows indexing by codepoint.

2. UTF-8 still often has **BOM (byte order mark)**

The pros of UTF-16:


---


## Endianness

**Endianness** refers to the sequential order in which bytes are arranged into larger numerical values when stores in memory. In **big-endian** format the MSB is stored first, i.e. has the lowest address. **Little-endian** format reverses this order.


---


## Code Point

In character encoding a **code point** is any of the numerical values that make up the code space. For example ASCII is comprised of 128 code points.


---


## Darwin Information Typing Architecture (DITA)

**DITA** is an XML data model for authoring and publishing.

An authoring system is a program that has pre-programmed elements for the development of interactive multimedia software titles. They are programs that allow a non-programmer to easily create software.


---

## Translation Files with gettext

`gettext` is a standard GNU translation system which can be used with PHP.

**Portable object (.po)** files are plain text files that contain your translation which can be safely edited by hand.

When edited each .po file must be indexed with the following:

```
msgfmt mydomain.po -o mydomain.mo
```

This produces a **machine object (.mo)** file indexing your translation for quick access. You then have to translate this file in other languages.


---


## WAR vs. JAR

**.jar** files contain the libraries, resources and accessories files.

**.war** files contain the web application that can be deployed on any servlet. They contain jsp, html, javascripts files necessary.

**.ear** files contain the EJB modules of the application.


---


## Makefile


By default, Makefile targets are "file targets" - they are used to build files from other files. Make assumes its target is a file, and this makes writing Makefiles relatively easy:

foo: bar
  create_one_from_the_other foo bar
However, sometimes you want your Makefile to run commands that do not represent physical files in the file system. Good examples for this are the common targets "clean" and "all". Chances are this isn't the case, but you may potentially have a file named clean in your main directory. In such a case Make will be confused because by default the clean target would be associated with this file and Make will only run it when the file doesn't appear to be up-to-date with regards to its dependencies.

These special targets are called phony and you can explicitly tell Make they're not associated with files, e.g.:

```
.PHONY: clean
clean:
  rm -rf *.o
```


---


## Hash functions

**SHA-1** is a cryptographic hash function.


---

## DNS Cache

A **DNS cache** is a temporary database maintained by the OS that contains records of all the recent visits and attempted visist to internet domains. The DNS cache attempts to speed up the IP lookup by handling the name resolution of recently visited addresses before the request is sent out to the internet.

The contents of the cache can be viewed on Windows with the command `ipconfig /displaydns`.

A DNS cache becomes poisoned or polluted when unauthorised domain names or IP address are inserted into it. To solve this you can flush the cache, which forces your computer to repopulate those address the next time ypou try accessing those websites. In Windows this is achieved with `ipconfig /flushdns`. On Mac you should use `dscacheutil -flushcache`.
