
# prompt()
The `prompt` method pops up a dialog box with an optional message that asks the user to enter some text.
```js
let name = prompt('What is your name?');
let guess = prompt();           // blank prompt window
```
The dialog lets the user input some text and click `OK` or `Cancel`. If the user clicks `Ok`, prompt returns the text as a string; if the user clicks `Cancel`, it returns `null`.

**It's important to note prompt always captures the user's input as a string. If the user's input is the number `1`, prompt returns the string `"1"`.**

# alert()
The `alert` method displays a dialog with a message and an `OK` button. Click the `OK` button to dismiss the dialog.
```js
alert('Hello, world');            // alert dialog box with a message
alert();                          // an empty alert dialog box
```
# Logging Debugging Messages to the JavaScript Console
The `console.log` method outputs a message to the JavaScript console. You should use this method for debugging purposes; users usually don't look at the console when they use browsers.

```js
let name = prompt('What is your name?');

console.log('Hello, ' + name);
```