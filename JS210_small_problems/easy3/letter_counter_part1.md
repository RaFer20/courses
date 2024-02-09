# Letter Counter Part 1
Write a function that takes a string consisting of one or more space separated words and returns an object that shows the number of words of different sizes.

Words consist of any sequence of non-space characters.

Examples:
```js
wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 1, "7": 2 }
wordSizes("What's up doc?");                              // { "2": 1, "4": 1, "6": 1 }
wordSizes('');                                            // {}
```

## Solution
```js
function wordSizes(string) {

  let wordArray = string.split(' ');
  let counter = {};

  for (let i = 0; i < wordArray.length; i++) {
    let wordSize = wordArray[i].length
    
    if (wordSize === 0) {
      continue;
    }

    if (counter[wordSize]) {
      counter[wordSize] += 1;
    } else {
      counter[wordSize] = 1;
    }
  }

  return counter;
}
```

Alternative:
```js
function wordSizes(words) {
  const wordsArray = words.split(' ');
  const count = {};

  for (let i = 0; i < wordsArray.length; i += 1) {
    let wordSize = wordsArray[i].length;
    if (wordSize === 0) {
      continue;
    }

    count[wordSize] = count[wordSize] || 0;
    count[wordSize] += 1;
  }

  return count;
}
```