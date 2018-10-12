# Record Groups

# Containers

Containers are a snapshot of the data that is transported as records. When data is stored within a container it is

## Other

`eTag`s are used for version management.

## Create RecordGroup from items on a chart

1. Use the `ChartServiceCallHelper` to `createRecordGroup()`.

2. Use the `RecordGroupHelper` to get a `RecordGroupSessionResponse` using the `createRecordGroupSession()`.

3. Use the record group helper again to `createRecordSession()` and get a `IRecordSession`.

## Definitions

* `IRecordSession`

The interface to retrieve the IRecordAndMetadata's.

* `IRecordGroupSession`

A non-threadsafe container for streaming data from the source to destination, to be used only in the context of the current thread.
