# Temporary Files

## Java

The following code is used for creating a temporary files that is saved in C:\Users\Ed\AppData\Local\Temp

```
properties.put('ImportBatchSize', '100')
final File tmpPropertiesFile = File.createTempFile('importConfigFile', '.txt')
properties.store(new FileWriter(tmpPropertiesFile), "Temporary properties file containing staging schema details")
```

## Gradle

To print the location of the temporary file in groovy then use the following snippet:

```
println '>>> The location of the temporary file is:'
println project.getProperty('importConfigFile')
```
