# i2 Snippets

## Parsing

```
def topology = SlurperUtils.newXmlSlurper().parse(filePath)
def databaseType = DatabaseTypes.DISCO
def infostore = topology.databases.database.find({ x -> (x.@'database-type.text() == databaseType)})
```

This is used to parse XML files to get configuration settings and topology.



## File Structure

`InfoStoreIngestionTasks.gradle` is used to do things such as create a staging table. How this works is that it calls the StagingTableCreatorCLI.java with all the correct arguments set.



## Getting User Arguments

```gradle
def variableName = InfoStoreUtils.getMandatoryPropertyOrLogError('variableName')

def optionalVariablename = InfoStoreUtils.getOptionalProperty(variableName, defaultValue)
```

The above methods ares used to get user arguments from the command line.


## $ sign in strings

The `$` sign in double-quoted strings is used for string interpolation in gradle.

NB. To escape and use an actual dollar sign then use a `\$`

## @ sign in strings

The `@` sign followed by single-quoted strings are a means of getting a target value from an xml file.


## Topology

depdev/dependencies/deploymenttoolkit/examples/configurations/information-store-opal/configuration/environment/topology

deployment/src/infrastructure/resources/opal-daod/configuration/environment/topology

Always put conditional logic in a `doLast{}` statement otherwise it will always be run.



  topology-updater.gradle in Apollo Core Toolkit updates the topology.

  DefaultsGenerator.groovy - generates default paths

  SlurpurUtils xml helpers for groovy

  TopologyGenerator.gr - this is a second machanism for creating the topology in a dynamic manner (as well as the static versions that are just copied)

### Validation
