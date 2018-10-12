# Events

Commands build events.

Much later the event handlers add to the chart.

## Event Client

Every event client should:

1. Do the change
2. Tell the client

All the events handlers should contain ids as opposed to live objects.

## Event Handler types

### `MoveNodesEventHandler`

We store absolute position not the relative position. The rule is to keep what we need and don't get the `ChartDAO` to calculate what we need.

### `RemoveNodeEventHandler`

There is a case when two nodes get put into one and then later one of the records in this larger node is deleted. The question then arises around the fact that this deleted record does not have an id as only the outer node has an id.

### `BulkCreateEvent`

Goes and creates a bunch of nodes. This is made harder when adding to an existing network. It has to figure what new things have to be added to the existing chart. The handlers figure out all these sub-events that are required. `BulkAddRecordEvent` is only about adding records to existing chart items, i.e. it is one of these sub-events.

## Other

`ChartCommit` is an optimisation to only update things that have changed.
