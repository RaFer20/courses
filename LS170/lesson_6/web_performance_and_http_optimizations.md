While browsers provide optimizations to help us, there are plenty of techniques within reach that allow us to turn the dials on how quickly and effectively we can deliver our content to users:

## *Limit the number of resources that need to be fetched*
Ensuring a web page or application view only includes the resources it really needs, can drastically improve the performance of web and networked applications.

## *Compression Techniques*
Rather than reducing the number of resources to be fetched, compression reduces the size of those resources.

An example of data compression would be using a utility like gzip on text-based assets such as HTML, CSS, and JavaScript which can reduce data size by 60-80%! Another example is minification which is the process of removing unnecessary or redundant data without affecting how it's processed by the browser. This could mean removing white-space, code comments, formatting, unused code, and using shorter variable & function names.

## *Reusing TCP Connections*
A major way that we can improve our performance is by re-using a TCP connection to fetch multiple resources, thereby eliminating the roundtrip latency for every handshake of a new connection.

These connections are usually referred to as `keepalive connections`, and with `HTTP/1.1` are standard behaviour, which means that all modern browsers will attempt to reuse a TCP connection automatically as long as the server is willing to cooperate. To make sure that you're actually leveraging this feature, you’ll need to check your application and server configurations to ensure that they support keepalive connections.

If you’re stuck with HTTP/1.0 you can enable keep alive connections by adding the Connection: `Keep-Alive header` to your HTTP requests/responses. Also, pay close attention to the default behavior of any HTTP libraries & frameworks you may use as *some may default to non-keepalive behavior to provide a “simpler API”.*

## *DNS Optimizations*
Similar to the approach discussed in reducing the number of resources, we can check if all included dependencies, such as fonts or external libraries, are required for a particular page or view.

Another method is to use a faster DNS provider and decide whether you’re willing to pay for a premium service. 

Another method is to download any external resources and host them locally on the server that is hosting the web app. This will remove the DNS lookups used for those resources since they live under the same hostname as your application. 

There can be some trade-offs involved here:
- If the external resource is hosted on a CDN (Content Delivery Network) this can provide a performance gain in reduced latency which can offset the time taken for the DNS lookup.

- If the external resource is, for example, a popular library, it may already be saved in the user's browser cache and so not need to be fetched at all.

## *Server-side Caching*
Caches are a separate component from the host server and are essentially a short-term memory bank. What they do is store content that was recently accessed by a user so that the next time that content is requested it can be delivered more quickly than requesting it from the application server.

The performance benefits of adding a cache can be significant as you take a potentially large number of requests that require some sort of action by the application, and move them to a cache that can quickly serve the already generated content. This also helps reduce the load on the application server, freeing it up to process and respond to a smaller number of requests more effectively.

Adding a cache is not a trivial solution. It’s a separate component to your application architecture which brings a lot of potential challenges you may have to face. These include knowing what data to store in the cache, when to remove data to free up the cache storage, what data to invalidate, and more.