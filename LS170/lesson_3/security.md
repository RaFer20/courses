# **Security**

## *Secure HTTP (HTTPS)*
With HTTPS every request/response is encrypted before being transported on the network. This means if a malicious hacker sniffed out the HTTP traffic, the information would be encrypted and useless.

HTTPS sends messages through a cryptographic protocol called TLS for encryption. These cryptographic protocols use certificates to communicate with remote servers and exchange security keys before data encryption happens.

A resource that's accessed by HTTPS will start with https:// instead of http://, and usually be displayed with a lock icon in most browsers.

## *Same-origin Policy*
The same-origin policy permits unrestricted interaction between resources originating from the same origin, but restricts certain interactions between resources originating from different origins. By origin, we mean the combination of the scheme, host, and port. So `http://mysite.com/doc1` has the same origin as `http://mysite.com/doc2`, but a different origin from `https://mysite.com/doc1` (different scheme), `http://mysite.com:4000/doc1` (different port), and `http://anothersite.com/doc1` (different host).

Same-origin policy doesn't restrict all cross-origin requests. Requests such as linking, redirects, or form submissions to different origins are typically allowed. Also typically allowed is the embedding of resources from other origins, such as scripts, css stylesheets, images and other media, fonts, and iframes. What is typically restricted are cross-origin requests where resources are being accessed programmatically using APIs such as `XMLHttpRequest` or `fetch`.

While secure, the same-origin policy is an issue for web developers who have a legitimate need for making these restricted kinds of cross-origin requests. Cross-origin resource sharing, or CORS, was developed to deal with this issue. CORS is a mechanism that allows interactions that would normally be restricted cross-origin to take place. It works by adding new HTTP headers, that let servers to serve resources cross-origin to certain specified origins. 


# **Security Concerns**

## *Session Hijacking*
Usually, the session id is implemented as a random string and comes in the form of a cookie stored on the computer. With the session id in place on the client side now every time a request is sent to the server, this data is added and used to identify the session. When a user's username and password match, the session id is stored on their browser so that on the next request they won't have to re-authenticate.

Unfortunately, if an attacker gets a hold of the session id, both the attacker and the user now share the same session and both can access the web application. In session hijacking, the user won't even know an attacker is accessing his or her session without ever even knowing the username or password.

*Countermeasures:*
- One popular way of solving session hijacking is by resetting sessions. This means a successful login must render an old session id invalid and create a new one. With this in place, on the next request, the victim will be required to authenticate. At this point, the altered session id will change, and the attacker will not be able to have access. *Most websites implement this technique by making sure users authenticate when entering any potentially sensitive area, such as charging a credit card or deleting the account.*

- Another useful solution is setting an expiration time on sessions. Sessions that do not expire give an attacker an infinite amount of time to pose as the real user. Expiring sessions after, say 30 minutes, gives the attacker a far narrower window to access the app.

- Another approach is to use HTTPS across the entire app to minimize the chance that an attacker can get to the session id.

## *Cross-Site Scripting (XSS)*
This type of attack happens when you allow users to input HTML or JavaScript that ends up being displayed by the site directly.

For example, if a form allows you to add comments, which will then be displayed on the site. Because it's just a normal HTML <textarea>, users are free to input anything into the form. This means users can add raw HTML and JavaScript into the text area and submit it to the server

If the server side code doesn't do any sanitization of input, the user input will be injected into the page contents, and the browser will interpret the HTML and JavaScript and execute it. In this case an alert message will pop up, which is definitely not the desired outcome. 

Attackers can craft ingeniously malicious HTML and JavaScript and be very destructive to both the server as well as future visitors of this page. For example, an attacker can use JavaScript to grab the session id of every future visitor of this site and then come back and assume their identity. It could happen silently without the victims ever knowing about it. Note that the malicious code would bypass the same-origin policy because the code lives on the site.

*Potential solutions for cross-site scripting:*
- One way to prevent this kind of attack is by making sure to always sanitize user input. This is done by eliminating problematic input, such as <script> tags, or by disallowing HTML and JavaScript input altogether.

- The second way to guard against XSS is to escape all user input data when displaying it. If you do need to allow users to input HTML and JavaScript, then when you print it out, make sure to escape it so that the browser does not interpret it as code.

(*Note:* To escape a character means to replace an HTML character with a combination of ASCII characters, which tells the client to display that character as is, and to not process it; this helps prevent malicious code from running on a page. These combinations of ASCII characters are called HTML entities.

Consider the following HTML: <p>Hello World!<\p>. Let's say we don't want the browser to read this as HTML. To accomplish this, we can escape special characters that the browser uses to detect when HTML starts and ends, namely < and >, with HTML entities. If we write the following: `&lt;p&gt;Hello World!&lt;\p&gt;`, then that HTML will be displayed as plain text instead.)

