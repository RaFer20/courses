# Responsive Design

## Media Queries
```css
a {
  color: #f00;
}

@media (max-width: 480px) {
  a {
    color: #06c;
  }
}
```
Any styles we put inside the media query block will apply when the screen width is 480px or less, as specified by the (max-width: 480px) query.


We can also use the words `not` and `and` in media queries, and choose different media types such as `screen`, `print`, or `speech`. 
Most common is a combination of screen media type and a min-width or max-width, like this:
```css
@media screen and (max-width: 1600px) {
  /* CSS for 1600px (or smaller) screens (no printers!) */
}
```

### Mobile-First and Desktop First
One key decision we must make when developing a website is to choose whether we want to use mobile devices or desktops as our primary device: the device our CSS expects when no media query is active.

Mobile-First approach:
```css
/* CSS for all cell phones and shared cross-browser CSS */

@media screen and (min-width: 481px) {
  /* CSS for tablets and larger */
}

@media screen and (min-width: 961px) {
  /* CSS for small desktop and laptop screens and larger */
}

@media screen and (min-width: 1501px) {
  /* CSS for large laptop and desktop displays */
}

@media print {
  /* CSS for printers */
}
```

Development starts in the section with no media query. This section provides the CSS for the smallest devices we want to support and any CSS that is common among all or most media queries we are supplying. 

We can use the remaining screen queries to provide CSS intended for larger mobile devices, small laptops and desktops, and large laptops and desktops respectively. There's also a media query for printing (we might not want to waste colored inks).

On the other hand, the desktop-first approach to site design starts with the full-scale large desktop design first, and then provides media queries for the smaller displays.

The mobile-first approach frequently results in faster downloads on mobile devices, while the desktop-first approach results in slower downloads. Most developers consider the mobile-first approach to be best-practice.

### Breakpoints
Contemporary mobile devices cover many different screen sizes, and its hard to differentiate between a large cell phone and a small tablet.

Rather than ask ourselves if we're working on a desktop or a cell phone, it's more useful to what layout works best over a range of screen sizes, then build each layout with the appropriate media query.

### Emulating Devices in Google Chrome

Chrome's developer tools now include most popular devices as emulations that you can use.
To view a web page as it appears on a specific device:
- Open the inspector.
- Click the emulation icon in the top bar (it looks like a smartphone resting atop a tablet in Chrome v64 - other versions may differ).
- Several drop-downs will appear above the web page.
- Select the device you want to emulate from the "Responsive" drop-down.
- Refresh the page to ensure the page loads everything it needs.

We can even simulate a slower connection by choosing mid-tier mobile or low-tier mobile to test performance at emulated network speeds.

You can edit the list of devices supported with the Edit option.
Other browsers often provide similar capabilities.

### Using Your Page on Multiple Devices
If we design our application with responsiveness in mind, we must put the following <meta> element in the <head> part of the <html>. 
It tells mobile devices how to handle that page; 
without it, those devices often display a miniaturized version of the page instead of showing the desired mobile device page described by our media queries and CSS.
```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```
*Don't use this tag if your app has no responsiveness traits.*

Search for "meta viewport" on MDN for more information on what <meta name="viewport"> does and how to use it.

## Fluid and Liquid Layouts
Fluid, liquid, responsive, elastic, hybrid. These layouts are nearly identical; the differences are minor.

### Liquid Layouts
Liquid layouts often employ percentage values for widths to maintain the same width ratios for content areas as the browser width changes.

Simple example of a liquid layout:
```html
<main>
  <article class="content">
    Enim Lorem aliqua anim nulla labore nulla ullamco. Deserunt fugiat duis ex
    dolor. Ex laboris ad officia minim quis.  Incididunt eu reprehenderit
    ullamco eiusmod dolor pariatur mollit qui. Officia aliqua velit deserunt
    adipisicing duis minim minim tempor.
  </article>

  <aside class="sidebar">
    Proident cillum ad cillum minim magna. Duis nulla est est non sunt. Est
    culpa laborum velit dolor.
  </aside>
</main>
```
```css
html {
  font-size: 16px;
}

body, article, p {
  margin: 0;
  padding: 0;
}

body {
  margin: 0;
  padding: 0.5rem;
}

main {
  clear: both;
  overflow: hidden;
  padding-bottom: 1.5rem;
}

.content,
.sidebar {
  box-sizing: border-box;
  float: left;
  padding: 20px 30px;
}

.content {
  background-color: pink;
  width: 70%;
}

.sidebar {
  background-color: cyan;
  width: 30%;
}
```
No matter how we adjust the browser window's width, the two columns maintain their width ratios. Such synchronized behavior is the foundation of both liquid and fluid layouts. As the browser width changes, so do the content areas.

If we want to resize the content article in the above example, we must resize the sidebar as well. For instance, if we set the article to 60%, we must set the sidebar to 40%.

There's an alternative: we can use the overflow property with any value except visible on the sidebar element. To use this technique, we must remove the float and width properties from the sidebar:
```css
.content,
.sidebar {
  /* delete: float: left; */
}

.content {
  float: left;
  width: 60%; /* was 70% */
}

.sidebar {
  overflow: hidden;
  /* delete: width: 30%; */
}
```
You can now change the width of the content without changing the width of the sidebar. 
The layout is "liquid" since it expands and contracts with the browser window's width.

Both `overflow: hidden` and `overflow: auto` can be used to achieve the same effect.
However, there are some differences between the two values:
- With hidden, the browser crops any content that doesn't fit inside the sidebar's container.
- With auto, the browser doesn't crop content, but it may show unwanted scrollbars on the sidebar.

### Fluid Layouts
Liquid layouts ordinarily take up the entire width of the browser window, no matter how big it gets. 
If we want to restrict the expansion or collapse, we need to use a fluid layout. Once the window reaches one of the limits, the element will stop expanding or collapsing and remain fixed in width as the width continues to change in the same direction. 
Fluid layouts expand and collapse like a liquid layout to a point, then become fixed once the browser width reaches a specific size.

We'll make some small changes to the example above and set a min-width and max-width on the container to prevent the site from becoming too spacious or cramped:
```css
main {
  max-width: 1000px;
  min-width: 500px;
}

.content,
.sidebar {
  padding: 20px 30px;
}

.content {
  box-sizing: border-box;
  float: left;
  width: 70%;
}

.sidebar {
  overflow: hidden;
}
```
When we resize the browser now, we'll see our layout change until we reach the minimum and maximum dimensions on the main element.