*1. What are the required components of an HTTP request? What are the additional optional components?*
The `HTTP method` and the `path` are required, and form part of what is known as the start-line or request-line. As of HTTP 1.0, the `HTTP version` also forms part of the request-line. The `Host header` is a required component since HTTP 1.1.

`Parameters`, all other `headers`, and message `body` are optional.

Technically speaking the `path` portion of the request-line is known as the `request-URI`, and incorporates the actual path to the resource and the optional parameters if present. *In practice, most people simply refer to this part of the request-line as the `path`.*


*2. What are the required components of an HTTP response? What are the additional optional components?*
A status line with a status code is required. Headers and body are optional.

*3. What determines whether a request should use GET or POST as its HTTP method?*
`GET` requests should only retrieve content from the server.
 They can generally be thought of as "read only" operations, however, there are some subtle exceptions to this rule. For example, consider a webpage that tracks how many times it is viewed. GET is still appropriate since the main content of the page doesn't change.

`POST` requests involve changing values that are stored on the server.
 Most HTML forms that submit their values to the server will use POST. Search forms are a noticeable exception to this rule: they often use GET since they are not changing any data on the server, only viewing it.