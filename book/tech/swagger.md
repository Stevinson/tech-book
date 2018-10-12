# Swagger

## .yaml

### Metadata, API name and Description

1. `swagger:` Every swagger document starts with Swagger version declaration
2. `info:` This is used to specify further metadata, such as:
   * `title` (required)
   * `version` (required)
   * `description`
   * `contact`
     * `name`
     * `url`
   * `license`
     * `name`
     * `url`



### URL definition

1. `schemes:` This is an array of protocols supported by the API.
2. `host:` T
3. `basePath:` The URL prefix for all the endpoints.



## Paths

The `paths:` object contains objects which are called the name of the endpoints, in the syntax: `/rating`. Each of these has an object for each of the verbs it is to implement (i.e. `post`, `put`, etc.):

1. `tags:`

   This is used to group related API endpoints.

2. `paths:`

   Defines the enpoints of the API.

   * `operationId:` -
   * `responses:` -
     * HTTP response number.
       * `description:`
       * `schema:`
   * `consumes:`
   * `produces:`
   * `description:`
   * `parameters:`


## Definitions

`definitions` have the same goal as MSON: to make it easy to describe data structures and use them in API description.

1. ​
