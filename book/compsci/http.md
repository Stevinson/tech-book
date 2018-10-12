# HTTP

## HTTP Status Codes

(Here)[https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html] is some documentation for HTTP status codes.

```Java
import javax.ws.rs.core.Response.Status;
```

Commonly used status codes defined by HTTP, see documentation for the complete list. Additional status codes can be added by applications by creating an implementation of Response.StatusType.

```Java
java.util.function.Function
```

Functional interfaces provide target types for lambda expressions and method references.

### 200 - OK

The request has succeeded. The information returned with the response is dependent on the method used in the request, for example:

GET an entity corresponding to the requested resource is sent in the response;

HEAD the entity-header fields corresponding to the requested resource are sent in the response without any message-body;

POST an entity describing or containing the result of the action;

TRACE an entity containing the request message as received by the end server.

### 201 - Created

The requirements has been fulfilled and resulted in a new resource being created. The new resource can be references by the URL returned in the entity of the response.

### 204 - No Content

The server has fulfilled the request but does not need to return an entity-body, and might want to return updated metainformation. The response MAY include new or updated metainformation in the form of entity-headers, which if present SHOULD be associated with the requested variant.

If the client is a user agent, it SHOULD NOT change its document view from that which caused the request to be sent. This response is primarily intended to allow input for actions to take place without causing a change to the user agent's active document view, although any new or updated metainformation SHOULD be applied to the document currently in the user agent's active view.

The 204 response MUST NOT include a message-body, and thus is always terminated by the first empty line after the header fields.

### 206 - Partial Content

The server is successfully fulfilling a range request for the target resource by transferring one or more parts of the selected representation that correspond to the satisfiable ranges found in the request's Range header field.

The server has fulfilled the partial GET request for the resource. The request MUST have included a Range header field indicating the desired range, and MAY have included an If-Range header field to make the request conditional.

### 302 - Found

The target resides temporarily under a different URI but the user should continue to use the effective request for future requests. The server should generate a location header field in the response.

### 303 - See Other

This indicates that the response to the request can be found under a different URI

### 304 - Not Modified

If the client has performed a conditional GET request and access is allowed, but the document has not been modified, the server SHOULD respond with this status code. The 304 response MUST NOT contain a message-body, and thus is always terminated by the first empty line after the header fields.

### 400 - Bad Request

The request could not be understood by the server due to malformed syntax. The client SHOULD NOT repeat the request without modifications.

### 401 - Unauthorised

Suggests that if authorisation is provided then the user may get access.

### 403 - Forbidden

Suggests that:

* Authorisation was provided but the user is not allowed permission.
* Permissions are forbidden for all users.

### 404 - Not Found

The server has not found anything matching the request url.

### 405 - Method not allowed

The method specified in the Request-Line is not allowed for the resource identified by the Request-URI. The response MUST include an Allow header containing a list of valid methods for the requested resource.

### 409 - Conflict

The request could not be completed due to a conflict with the current state of the resource. This code is only allowed in situations where it is expected that the user might be able to resolve the conflict and resubmit the request. The response body SHOULD include enough information for the user to recognize the source of the conflict. Ideally, the response entity would include enough information for the user or user agent to fix the problem; however, that might not be possible and is not required.

### 410 - Gone

The requested resource is no longer available at the server and no forwarding address is known. The condition is expected to be considered permanent.

### 416 - Range Not Satisfiable error

### 500 - Internal Server Error

The server encountered an unexpected condition which prevented it from fulfilling its request.

### 502 - Invalid Response

### 503 - Service Unavailable

The server is currently unable to handle the request due to temporary overloading or maintenance of the server. Tge implication is that this is a temporary condition that will be alleviated after some delay.

---


## Request Parts

An http request is made of constituent parts.

### Entity

An HTTP entity is the majority of an HTTP request or response, consisting of some of the headers and the body, if present. It seems to be the entire request or response without the request or status line (although only certain header fields are considered part of the entity).

In a word, Entity is an optional payload inside an http message(either request or response), so it is a "part-whole" relation between Entity and Message.


---


## Verbs

### PUT

Used to create a resource, or override it.

### POST

Used to modify and update a resource (i.e replace it in its entirety).

### PATCH

Used when you're updating an existing resource in part.

### DELETE

### GET


---


## Directives in Headers

### Cacheable

* **public**

Indicates that response may be cached by any cache.

* **private**

Indicates that all or part of the response is intended for a single user and MUST NOT be cached.

* **no-cache**

###

* **no-store**

The no-store directive is to prevent the inadvrtent release r retention of sensitive information. The directive applies to the whole message and may be sent in either a response or a request.



---

Good resource for http:

https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Range

## Range

The range of a http request header indicates the part of a document that the server should return.

Range: <unit>=<range-start>-

If the server sends back ranges, it uses the **206 Partial Content** for the response. If the ranges are invalid, the server returns the **416 Range Not Satisfiable error**. The server can also ignore the Range header and return the whole document with a 200 status code.
