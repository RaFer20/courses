# Letter Swap
Given a string of words separated by spaces, write a function that swaps the first and last letters of every word.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces, and that there are no leading, trailing, or repeated spaces.

Examples:
```js
swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a"
```


## Solution
```js
function swap(string) {
  let array = string.split(' ');
  let result = [];

  for (let i = 0; i < array.length; i++) {
    let wordArr = array[i].split('');
    [wordArr[0], wordArr[wordArr.length - 1]] = [wordArr[wordArr.length - 1], wordArr[0]]
    result.push(wordArr.join(''))
  }

  return result.join(' ');
}
```

Alternative:
```js
function swap(words) {
  const wordsArray = words.split(' ');

  for (let i = 0; i < wordsArray.length; i += 1) {
    wordsArray[i] = swapFirstLastCharacters(wordsArray[i]);
  }

  return wordsArray.join(' ');
}

function swapFirstLastCharacters(word) {
  if (word.length === 1) {
    return word;
  }

  return word[word.length - 1] + word.slice(1, -1) + word[0];
}
```


## Further Exploration
How can you refactor this problem using the Array.prototype.map method instead?

```js
function swapFirstLastCharacters(word) {
  if (word.length === 1) {
    return word;
  }

  return word[word.length - 1] + word.slice(1, -1) + word[0];
}

function swap(words) {
  const wordsArray = words.split(' ');

  return (wordsArray.map((word) => swapFirstLastCharacters(word))).join(' ')
}
```