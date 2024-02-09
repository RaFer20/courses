# Bannerizer
Write a function that will take a short line of text, and write it to the console log within a box.

Examples:
```js
logInBox('To boldly go where no one has gone before.');
```

will log on the console:
```js
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
```
```js
logInBox('');
+--+
|  |
|  |
|  |
+--+
```
You may assume that the output will always fit in your browser window.


## Solution
```js
function logInBox(string) {
  let lineLength = (string.length + 2);
  let spaces = ' '.repeat(lineLength);
  let dashes = '-'.repeat(lineLength);

  for (let i = 1; i <= 5; i++) {
    if (i === 1 || i === 5) {
      console.log(`+${dashes}+`);
    } else if (i === 2 || i === 4) {
      console.log(`|${spaces}|`);
    } else if (i === 3) {
      console.log(`| ${string} |`);
    }
  }
}
```