# Planning Meeting 1

## MapDB

1. Containers (immuable)
2. Undo
3. metadata
4. Serialisable Chart (in memory only)

## Data Structure

i2 Analyze record - (single) -> Chart record - (many) -> Item - (single) -> Node - (many) -> Super Node
        1                              2                  3                  4                    5

(currently don't have the Chart Record and Item parts of the structure at the moment)

1. actual record - immutable so a new one is added every time record added). Range maps groups records by metadata. Currently We store records in a range (i.e. 1-10 is for data, 11-20 is for metadata) - apparently this is madness. This could be replaced by a properties map, which maps  
2. (metadata: time stamp, when added to chart, who added it)
3.
4. The visualisation of the Item
5.

All these different levels in the object model have different graph models.

## Postman

To get to a suitable world for using postman to hit the chart endpoints follow these steps:

1. One must create a **job**. The *New Job* request in the Jobs directory does this, returning the id that is required.

1.5. (Optional) One can get the JSON summarising all your charts by sending the *Get Chart* request, with the **chartId** removed.

2. Get a specific chart by setting the chartId with the value from the last step.

3. Take control of this chart with the *Take Control* request, which returns the chart version.

Can now perform actions on the chart, such as *Add record group to the chart*:

4. A *Text Search* request fetches a serchId.

5. This searchId is then used in a *Search Results* request then returns the JSON for the search results. Copy the id of the items that you want added to the chart.

6. Use the *Mark* request with the id to get a recordGroupId for these items.

7. This recordGroupId with the *Add record group to the chart* request will put those items on the chart.
