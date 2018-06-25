# Deduplication

## Intro

The boxnote on the subject is found [here](https://ibm.ent.box.com/file/266792658593).

There are two types of deduplication:

1. On the container level when two records are about the same element.

2. On an item level, where we don't want the chart to duplicate an element.

## Container level deduplication


### Method 1

In this approach a single container is scoped by a single RecordGroup. Within the RecordGroup, each Record must specify a record id. The contract is that the record id must uniquely identify the record with that RecordGroup.

### Method 2



1. A check for equality is done on the origin identifier on the type (*equals()*)and the keys(*hashCode()*).

2. Another equality check is done for the data store id. (Version checking to the chart level deduplication).

## Chart level deduplication

1. Similar to the above case, but the record's version is now also compared so that iaoi it has a higher version number will the record reference be updated.

An item on the chart has a record reference.

## Chart level merging

In merging the data store id and versions are not compared.

1. The `Provenance` and `RecordHistory` have to be compared.

2.

## API and process

See the diagram in my notebook for the class diagram relating to deduplication.

When the endpoint The `AddRecordGroupHandler` is constructed with a `RecordPump` which allows it to ... The `generateEvents()` method of `AddRecordGroupHandler` is what

The `RecordPump` is constructed with a `Deduplicator` which allows it to only pass RecordGroups to Containers that are not duplicates. It does this in the `pump()` method that populates the `mRecordGroupContainerPopulator`.

`Deduplicator` has a `deduplicate()` method that does the check and returns the `ContainerRecordAndContext` that was being checked as a `DeduplicatedRecordAndContext` if it is indeed a duplicate.

deduplicate() uses the `contains()` method in the `ChartDeduplicationIndex` to check whether the new record is a duplicate.

##

`EventsBuilderMap` has the logic that determines whether an incoming record belongs to an item already on the chart.
