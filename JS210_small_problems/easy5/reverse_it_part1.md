# Reverse It Part 1
Write a function that takes a string argument and returns a new string containing the words from the string argument in reverse order.

Examples:
```js
reverseSentence('');                       // ""
reverseSentence('Hello World');            // "World Hello"
reverseSentence('Reverse these words');    // "words these Reverse"
```


## Solution
```js
function reverseSentence(string) {
  let wordArr = string.split(' ');
  let newStr = '';

  for (let i = (wordArr.length - 1); i  >= 0; i--) {
    if (i === 0) {
    newStr += wordArr[i];
    } else {
      newStr += wordArr[i] + ' ';
    }
  }

  return newStr;
}
```

Shorter Alternative:
```js
function reverseSentence(string) {
  return string.split(' ').reverse().join(' ');
}
```