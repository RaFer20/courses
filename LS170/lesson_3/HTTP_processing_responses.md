# HTTP Processing Responses

## Status Codes

Useful status codes:
Status Code	        |Status Text	          |Meaning
200	                |OK	                    |The request was handled successfully.
302	                |Found	                |The requested resource has changed temporarily. Usually results in a redirect to another URL.
404	                |Not Found	            |The requested resource cannot be found.
500	                |Internal Server Error	|The server has encountered a generic error.


### 200 OK
The most common response status code you'll encounter is `200` which means the request was handled successfully.

### 302 Found
When a resource is moved, the most common strategy is to re-route the request from the original URL to a new URL. The general term for this kind of re-routing is called a `redirect`. When your browser sees a response status code of `302`, it knows that the resource has been moved, and will automatically follow the new re-routed URL in the Location response header.

### 404 Not Found
The server returns this status code when the requested resource cannot be found. Remember, a resource can be anything including audio files, CSS stylesheets, JavaScript files, images etc.

### 500 Internal Server Error
A `500` status code says "there's something wrong on the server side". This is a generic error status code and the core problem can range from a mis-configured server setting to a misplaced comma in the application code. But whatever the problem, it's a server side issue. Someone with access to the server will have to debug and fix the problem, which is why sometimes you see a vague error message asking you to contact your System Administrator.


################################################################################################################################################

## Response Headers

Some common response headers:
Header Name	          |Description	                            |Example
Content-Encoding	    |The type of encoding used on the data.	  |Content-Encoding: gzip
Server	              |Name of the server.	                    |Server:thin 1.5.0 codename Knife
Location	            |Notify client of new resource location.	|Location: https://www.github.com/login
Content-Type	        |The type of data the response contains.	|Content-Type:text/html; charset=UTF-8

