# Codebase

## Creating an Endpoint

### Notes

Jackson -> ChartResourceDelegateWrapper -> ? -> ChartResourceDelegateWrapper -> ChartResourceDelegateInternal -> Code

When adding a new endpoint one needs to add the method to `ChartResourceDelegate`, `ChartResourceDelegateWrapper` and `ChartResourceDelegateWrapperInternal`.

### API

`ChartResourceDelegateWrapperInternal`

This sets up Guice bindings.

`ChartResourceDelegateWrapper`

This is for JAX-RS.

`ChartResourceDelegate`

This is where the code that implements the action for the endpoint is written.

`ApplicationConfig`

This states the classes that should be at the top level and will define the endpoints.

`IChartResource`

This is called by the ChartResourceDelegate classes, and is used to **define endpoints**. For example it creates the search and explore endpoints. It requires:

  * The type of HTTP request.
  * The url path of the endpoint. If a dynamic element is required in the path as opposed to a static one, then the `@PathParam` attribute is used. the `ChartURLModule` is used to build up these url paths.
  * Consumes - defines the media types that the MessageBodyReader can accept.
  * Produces - defines the media types that the MessageBodyReader can produce.

Then in each method (i.e. endpoint) you need to have a validator and a do-er.

#### JSON

`RestServiceContext`

This gives the original JSON

---

## Service Test API

* `TestChartService`

* `TestServiceCallHelper`

*

---

## Editing a Chart

* `ChartWork`

Inside a request, only a single item of chart work can be used to mutate the chart, while as many items of chart work may be used to read from the chart as required.

* `IChartTransactionManager`

This interface defines all the ways in which work can be done on a chart. The most common is `readFromAtomic()` which runs read-only work whilst locking the chart so that noone else can modify the chart whilst that work is being completed.

* `IChartResourceManagementHandler`

The handler for all chart management operations, such as creating, deleting and changing the controller of a chart.

---

## Chart data

* `IChartDAO`

Is a long class that holds a bunch of methods that allow us to access a chart's data.

NB. DAO stands for data access object. This is a poor name as the class is more of a data model.

* `ChartRecordGroupRequest`

This is a REST resource for creating a chart record group. It allocated three things to a record group:

1. The **operation** that creates the record group.
1. The **identifiers** of the elements of the chart that contain the items for the record group.
1. An **ID** for the record group.

The `ChartRecordGroupRequest`s are processed by the `ChartRecordGroupRequestHandler`.

* `RecordGroup`

A `RecordGroup` (which has an ID) is a means to start a `IRecordGroupSession` (and hence get its data). They are threadsafe and are in sync order, unlike the session.

`ProvenanceSession` are the IDs.
`RecordSession` are the IDs and data.

### Law Enforcement data

To find the different type IDs and associated data ids, look in `TestLawEnforcementSchemaIDsAccessor`
