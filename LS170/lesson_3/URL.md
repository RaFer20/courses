A `URL` is the most frequently used part of the general concept of a `Uniform Resource Identifier` or `URI`, which specifies how resources are located.

## **URL Components**

When you see a URL, such as "http://www.example.com:88/home?item=book", it is comprised of several components. 
We can break this URL into 5 parts:

### *http*: 
The scheme. It always comes before the colon and two forward slashes and tells the web client how to access the resource. In this case it tells the web client to use the Hypertext Transfer Protocol or HTTP to make a request. Other popular URL schemes are ftp, mailto or git. You may sometimes see this part of the URL referred to as the "protocol". There is a connection between the scheme and the protocol, as the scheme can indicate which protocol (or system of rules) should be used to access the resource. However, the correct term to use in this context is "scheme".

### *www.example.com*: 
The host. It tells the client where the resource is hosted or located.

### *:88* :
The port or port number. It is only required if you want to use a port other than the default.

### */home*: 
The path. It shows what local resource is being requested. This part of the URL is optional.

### *?item=book* : 
The query string, which is made up of query parameters. It is used to send data to the server. This part of the URL is also optional.


**Unless a different port number is specified, port 80 will be used by default in normal HTTP requests.** Even though this port number is not always specified, it's assumed to be part of every URL. To use anything other than the default, one has to specify it in the URL. 
Example: 
`http://www.example.com:3000/profile` specifies that we want to use port 3000.



## **Query Strings/Parameters**

A simple URL with a query string might look like:
http://www.example.com?search=ruby&results=10

`Query String Component`      	`Description`
 ?	                             This is a reserved character that marks the start of the query string
 search=ruby	                   This is a parameter name/value pair.
 &	                             This is a reserved character, used when adding more parameters to the query string.
 results=10	                   This is also a parameter name/value pair.


Suppose we have the following URL:
`http://www.phoneshop.com?product=iphone&size=32gb&color=white`

In the above example, `name/value` pairs in the form of `product=iphone`, `size=32gb` and `color=white` are passed to the server from the URL. This is asking the `www.phoneshop.com` server to narrow down on a product iphone, size 32gb and color white. 
How the server uses these parameters is up to the server side application.

**Because query strings are passed in through the URL, they are only used in HTTP GET requests.**
Most links also issue HTTP GET requests, though there are some minor exceptions.


*Limits of query strings:*
- Query string have a maximum length. If we have to pass on a lot of data, we won't be able to do so using query strings.

- The name/value pairs used in query strings are visible in the URL. Passing sensitive information in this manner is not recommended(username,passwords, etc.)

- Space and special characters like & cannot be used with query strings. They must be URL encoded.


## **URL Encoding**
URLs are designed to accept only certain characters in the standard 128-character ASCII character set. Reserved or unsafe ASCII characters which are not being used for their intended purpose, as well as characters not in this set, have to be encoded. *URL encoding serves the purpose of replacing these non-conforming characters with a % symbol followed by two hexadecimal digits that represent the equivalent UTF-8 character.*

UTF-8 uses 1-4 bytes to represent every possible character in the Unicode character set. Below are some popular encoded characters and example URLs:
`Char`	  `UTF-8 code`	  `URL`
Space	     %20	          http://www.thedesignshop.com/shops/tommy%20hilfiger.html
$	         %24	          http://www.spam.com/i-have-%2410-million-for-you
£	         %C2%A3	        http://www.spam.com/big-inheritance-%C2%A3-millions
€	         %E2%82%AC	    http://www.spam.com/big-inheritance-%E2%82%AC-millions
𐍈	         %E2%82%AC	   http://www.symbols-of-the-world.com/hwair-%E2%82%AC

It's helpful to remember that all characters in the ASCII character set as well as those in the extended ASCII character set (see http://www.asciitable.com/) have single-byte UTF-8 codes. Thus, $ can be represented as %24, and Æ can be represented as %92.


Characters *must* be encoded if:
1. 
They have no corresponding character within the standard ASCII character set. Note that this means all extended ASCII characters as well as 2-, 3-, and 4-byte UTF-8 characters.

2. 
The use of the character is unsafe since it may be misinterpreted or modified by some systems. For example, `%` is unsafe since it is used to encode other characters. Other unsafe characters include `spaces`, `quotation marks`, the `#` character, `< and >`, `{ and }`, `[ and ]`, and `~`, among others.

3. 
The character is reserved for special use within the URL scheme. Some characters are reserved for a special meaning; their presence in a URL serves a specific purpose. Characters such as `/`, `?`, `:`, `@`, and `&` are all reserved and must be encoded. For example `&` is reserved for use as a query string delimiter. `:` is also reserved to delimit host/port components and user/password.




*Only alphanumeric and special characters `$-_.+!'()"`, and reserved characters when used for their reserved purposes can be used unencoded within a URL.* As long as a character is not being used for its reserved purpose, it has to be encoded.

