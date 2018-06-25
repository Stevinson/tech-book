# Other

## Mark

* When operating on selected items, there are three steps:

1. Operate on a stream of the selected entities

2. Operate on a stream of the selected links

3. Operate on a stream of all the entities. The way we know if a particular entity is one that we operated on in the first step is by noting those as **marked**.

## Touched

## Other


- A lead record is used to determine what entity gets put as the link end when two entities are split, having been merged together.

## Scale Out

HTTP server with multiple chart edit serves and an IS server. Requests come in on client auth and then go back through the HTTP server. Also have an event server listening to the client servers.

NB. kafka: topics and queues.

## Solr and Zookeeper

Zookeeper manages what nodes use which shards. Solr is segmented into (many) collections, each of which have many Shards. Shards across collections can be allocated nodes, which are the processing unit.

## Terminology

* Elements is the group that holds nodes and edges.
* Merge: two elements are the same
* Summarisation: collapsing multiple links to one but keep the fact that there were multiple


---


# NuGraphJ

## Edges

Edges are breaks in the links between entities. They give extra visual flexibility, for example the ability to make a link go round another link, instead of through. In NuGraph world they are called **control points**. If we want to add them to charts then look at the example code (l.409 in `Program.java`).


---


## Retrieval Blocks

Retrieval blocks are a means of providing information that allow the server to ... We use them as a hangover from Onyx. This is because we no longer guarantee that the Infostore is the source of the data so we need to know the origin of the data so that we can get the guaranteed latest version, and not just the latest stored in the cache.

For example, if we have a database that we do not own (and therefore cannot edit) but we want to do services on (e.g. geo-spatial capabilities) then information can be provided in the retrieval block that reverts to these services.


---


## Client Authentication

Created SSL certificate for server opal-server. The certificate is created with CN=edwardstevinson-mbp.cambridge.uk.ibm.com,OU=opal-server,O=ibm,C=us as the SubjectDN.


---


## AppScan

AppScan Standard is for automated testing for vulnerabilities. AppScan Source is for analysing code.

Project h039_Disco_AppScan_Test_Runner


Okay, I can see your screen now.11:24:57
I will try some things from here.11:25:37
Okay, my SME looked at this, and he sees the issue - the Windows image you are running right now is not officially supported with IBM.

He told me that so far, only Windows 7 licenses are officially supported by IBM VMware installations.

That is what is causing this issue - your system is not a pre-configured IBM image. I am afraid that I won't be able to do more in this case, no matter how much I want to help :-(
