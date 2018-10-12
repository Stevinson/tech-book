# Components

## Publishing from Command Line

```
mkdir publish
mv macos*tar.gz publish
components publish "External/IBM JDK 8 Darwin Binary Distribution:8.0.3.10" /copy_to_repository /export_fs:$PWD/publish /retraction:deprecate /retract_at:+6m
```

# Version Variable

Often there is a placeholder variable in the manifests. This is set in the `UnfetchedManifest` file in the FetchedManifests directory.
