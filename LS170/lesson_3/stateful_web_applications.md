# Stateful Web Applications

HTTP is stateless. This means the server does not hang on to information between each request/response cycle.

Each request made to a resource is treated as a brand new entity, and different requests are not aware of each other. 
This statelessness is what makes HTTP and the internet so distributed and difficult to control, but it's also the same ephemeral attribute that makes it difficult for web developers to build stateful web applications.

Web developers employ techniques to simulate a `stateful` experience.
Some of these approaches are:
- Sessions
- Cookies
- Asynchronous JavaScript calls, or AJAX

Theres also a 4th approach that used to be nearly universal but is mostly gone from most modern websites, thats sending stateful data as query parameters when making a request.

Examples:
When we log in to a website, how does the server "remember" our username and display it even after sending a new request if HTTP is a stateless protocol?

How come we can add items to a shopping cart on a website, sometimes across multiple days, and the cart retains our items.



## *Sessions*
With some help from the client (i.e., the browser), HTTP can be made to act as if it were maintaining a stateful connection with the server, even though it's not. One way to accomplish this is by having the server send some form of a unique token to the client. Whenever a client makes a request to that server, the client appends this token as part of the request, allowing the server to identify clients. In web development, we call this unique token that gets passed back and forth the `session identifier`.
This mechanism of passing a `session id` back and forth between the client and server creates a sense of persistent connection between requests. 

Each request is still unaware of every previous (or following) request.

There are a several consequences to this faux statefulness:

- Every request must be inspected to see if it contains a session identifier.
- If the request does contain a session id, the server must check to ensure that this session id is still valid. The server needs to maintain some rules with regards to how to handle session expiration and also decide how to store its session data.
- The server needs to retrieve the session data based on the session id.
- The server needs to recreate the application state (e.g., the HTML for a web request) from the session data and send it back to the client as the response.

The server works very hard to simulate a stateful experience, and every request still gets its own response, even if most of that response is identical to the previous response.
There are many advanced techniques that servers employ to optimize sessions and there are also many security concerns.

## *Cookies*
A `cookie` is a piece of data that's sent from the server and stored in the client during a request/response cycle. `Cookies` or `HTTP cookies`, are small files stored in the browser and contain the session information. 
By default, most browsers have `cookies` enabled. When you access any website for the first time, the server sends session information and sets it in your browser `cookie` on your local computer. 
The actual session data is stored on the server. The client side `cookie` is compared with the server-side session data on each request to identify the current session. This way, when you visit the same website again, your session will be recognized because of the stored `cookie` with its associated information.



## *AJAX*
AJAX is short for Asynchronous JavaScript and XML.
It allows browsers to issue requests and process responses without a full page refresh. When AJAX is used, all requests sent from the client are performed asynchronously, which just means that the page doesn't refresh.

when performing a search on google, every letter you type is issuing a new request, which means that an AJAX request is triggered with every key-press. The responses from these requests are being processed by some callback. You can think of a callback as a piece of logic you pass on to some function to be executed after a certain event has happened.

The main thing to remember is that AJAX requests are just like normal requests: they are sent to the server with all the normal components of an HTTP request, and the server handles them like any other request. The only difference is that instead of the browser refreshing and processing the response, the response is processed by a callback function, which is usually some client-side JavaScript code.