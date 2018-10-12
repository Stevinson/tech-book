# Other

`pathJar(<jar_name>, fileTree(dir: <path>, includes: [<jar_names>]))``

This is a means of condensing several jars into one.

security template with the xml

ensuresecurecookiesinliberty



deploybasicuserregistry


## Groovy

To debug a groovy file create a new groovy file and use println with a main.

```
static void main(String[] args)
{
    Bob bob = new Bob()
    println bob.discoTopologyWithValidSecureSolrKeyStoreConfig
}
```

## Gradle Daemon

The Gradle daemon runs Gradle as a background process, meaning that it quickens further build runs. It is recommended that it is ran on dev boxes but not CI boxes.

To enable/disable it, from the command line:

```bashrc
--daemon
--no-daemon
```

or from <<GRADLE_USER_HOME>>/gradle.properties file with the `org.gradle.daemon=true` property.

## Debugging

Instead of using `println` to print messages for debugging, using `logger.quiet()`, `logger.warn()` or `logger.error()` (7 for each level), means that the task can be run with `-i, --info` to print the extra information.

## Profile

`gradle --profile <task_name>`

This adds a profile folder to the build directory, which contains information about that task such as build time and the configuration.

## Parallel

`gradle --parallel <task_name>`

Runs projects in parallel where possible.
