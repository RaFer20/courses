Code	Character
\n	  New line
\t	  Tab
\r	  Carriage return
\v	  Vertical tab
\b	  Backspace

We may sometimes need to escape standard characters. For example, if we have a string that contains single quote characters and we use single quotes around the whole string, then we must escape the internal quote character. 

For instance:
```js
let quote = '"It\'s hard to fail, but it is worse never to have tried to succeed." - Theodore Roosevelt';

// or

let quote = "\"It's hard to fail, but it is worse never to have tried to succeed.\" - Theodore Roosevelt";
```