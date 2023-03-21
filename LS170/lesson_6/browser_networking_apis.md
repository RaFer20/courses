

## XHR
XHR is short for XMLHttpRequest. XML is a markup language that defines a set of rules for encoding documents, but you won’t need to worry about learning XML since XHR can also use data in the form of JSON, HTML, or plain text. At its core, XHR enables clients to manage requests and responses programmatically and asynchronously. XHR is a key component of Asynchronous JavaScript and XML (or AJAX for short). 

XHR can be used to provide the kind of real-time notification functionality described earlier. Since we can manage requests and responses asynchronously and programmatically, we could write a script that runs in the background of our application and issues a request to the server periodically (say, every 60 seconds) to check for updates. This kind of implementation is referred to as polling.

One of the main issues with polling is that there is the potential for lots of unnecessary checks; There's a more efficient version of this system known as long-polling. With long-polling, the client makes a request, but rather than returning an empty or negative response, the server keeps the connection idle until an update is available and then issues a response.

While XHR is popular for “real-time” delivery of data updates via the use of polling or long-polling, it may not be the most performant solution when compared to the SSE and WebSocket APIs. XHR is optimized for communicating with HTTP requests and responses, but doesn’t support one side streaming messages to the other.

## SSE
SSE stands for `Server-Sent Events` and is a networking API that enables efficient server-to-client streaming of text-based event data.

It enables the server to send real-time notifications or updates created by the server to the client, without requiring the client to send a request for the updates.

The way that SSE achieves this is through the delivery of messages over a single, long-lived TCP connection. So once the client and server complete the TCP handshake and perform the first request-response cycle, instead of closing the connection the client actually keeps it open to the server in order to receive any future updates.

There are trade-offs when using SSE and those include:
- The API only works with a client-server model
- It does not allow for request streaming such as when streaming a large upload to the server
- Streaming support is specifically designed to transfer UTF-8 data, which means that binary streaming is inefficient

SSE enables efficient, low-latency server-to-client streaming of text-based data in which the client initiates a connection and the server streams updates to the client. After the initial handshake to establish the connection, the client can no longer send any data to the server using that particular connection; instead the server uses it to provide real-time data updates to the client.

## WebSocket
The WebSocket API is a simple and minimal API that enables us to layer and deliver arbitrary application protocols between the client and server such that either side can send data to the other at any time.

It’s the only transport that allows a client and server to establish a persistent TCP connection that allows either side to independently send messages to each other. This means that the client can send information to the server, and vice versa, without needing a request from the other side. This form of communication is known as `bidirectional communication`.

Communication over WebSocket consists of messages and application code that does not need to worry about buffering, parsing, and reconstructing received data. It provides low latency delivery of text and binary application data in both directions and overall is a perfect fit for delivering custom application protocols in the browser.