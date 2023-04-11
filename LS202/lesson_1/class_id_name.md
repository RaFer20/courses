Class:
```html
<table>
  <tbody>
    <tr class="teaching-assistant">
      <td>Elizabeth</td>
      <td>JS230</td>
    </tr>

    <tr>
      <td>Nancy</td>
      <td>RB101</td>
    </tr>

    <tr>
      <td>Joe</td>
      <td>RB120</td>
    </tr>

    <tr class="teaching-assistant">
      <td>Pete</td>
      <td>JS225</td>
    </tr>

    <tr>
      <td>Kim</td>
      <td>LS202</td>
    </tr>
  </tbody>
</table>
```
```css
tr {
  background-color: lime;
  font-size: 200%;
}

.teaching-assistant {
  background-color: yellow;
}
```
- Use the class attribute to assign a class or classes to an element.

- Any number of elements may belong to the same class.

- Any element can belong to one or more classes. List all the names separated by spaces in the class attribute, e.g., class="executive management full-time".

- Prefer semantic class names; they should provide meaning. For instance, use teaching-assistant rather than yellow-background.

- Use CSS class selectors (.classname) to select elements by class, e.g., .teaching-assistant.

- Class selectors have lower CSS specificity than ID selectors (an ID selector overrides a class selector), but higher than tag name selectors (a class selector overrides a tag selector). Thus, the .teaching-assistant selector overrides the tr selector. See Getting to Know CSS.

################################################################################################################################################
IDs:
```html
<h1>This is a plain h1 heading</h1>
<h1 id="headline">This is my headline</h1>
```
```css
#headline {
  color: red;
  font-size: 48px;
}
```

- Use the id attribute to assign an ID to an element.

- Each ID on a page must be unique.

- Each element can have one ID or none.

- Use semantic ID names; they should provide meaning. For instance, use an ID name of headline rather than big-font.

- Use CSS ID selectors (#idname) to select elements by ID, e.g., #headline.

- ID selectors have higher CSS specificity than class selectors (an ID selector can override a class selector).
################################################################################################################################################
Names:
 the name attribute ties form elements to data on the server - it typically doesn't play a role in styling. You can use the [name="field-name"] selector to select elements by name, but you should use a class or ID selector instead. When you submit a form, the browser sends the form data to the server using name/value pairs in which each name comes from the associated name attribute. For instance:

```html
<form method="get" action="#">
  <label for="first-name-field">First name:</label>
  <input type="text" name="first-name" id="first-name-field">

  <label for="last-name-field">Last name:</label>
  <input type="text" name="last-name" id="last-name-field">

  <input type="submit" value="Search">
</form>
```

When you submit this form, the browser constructs a query string that looks like this:
```
first-name=Joe&last-name=Jones
```

Note that the browser does not send the id attribute value to the server.

Since the for attribute references an ID, it's accepted practice to use both a name and an id on form elements and to use the same value for both:
```html
<form method="get" action="#">
  <label for="first-name">First name:</label>
  <input type="text" name="first-name" id="first-name">

  <label for="last-name">Last name:</label>
  <input type="text" name="last-name" id="last-name">

  <input type="submit" value="Search">
</form>
```

- Use the name attribute to assign a name to a form data element that the server can use to obtain the value.

- Not all tags accept the name attribute; it applies to input controls in forms. Some other elements have a name attribute, too, but with a different meaning.

- Always use a name attribute on form elements that accept it.

- Each name in a form should be unique to that form except for radio buttons and checkboxes that belong to a single group.

- Use descriptive name values, not semantic. For instance, use name="last-name" instead of name="input-field".

- Avoid trying to select elements in CSS by using the name attribute.