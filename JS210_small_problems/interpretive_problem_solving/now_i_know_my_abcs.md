A collection of spelling blocks has two letters per block, as shown in this list:
```js
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
```

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument and returns true if the word can be spelled using the set of blocks, false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

Examples:
```js
isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true
```

# Problem
input: string
output: boolean

consider letters case-insensitive
each block can only be used once

# Examples/Test Cases
```js
isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true
isBlockWord('floW');       // true
isBlockWord('APPLE');      // false
isBlockWord('apple');      // false
isBlockWord('apPLE');      // false
isBlockWord('Box');        // false
isBlockWord('jeff');       // false
```

# Data Structures
Object
Array of used letters

# Algorithm
create an object so each letter has the letter associated with it as a value 
(this includes the reverse of it: `B: 'O'` and `O: 'B'`)
uppercase the input string
initialize an empty array named `used`
loop over the letters of the uppercased input string 
if they are already present in `used` return false
else push each letter and the letter associated with it into `used` and continue
return true

Alternative 1:
Define an array that contains the 13 two-letter blocks
Turn the input string into an array of letters and iterate through it. For each letter:
If we can't find a block that contains the letter, return false
Otherwise, remove the block that contains the letter from the blocks array
Return true after we've processed all the letters in the input string

Alternative 2:
Turn the blocks into an array of regex patterns, such as `/B|O/gi`
Match the word against all the block regex
If there's more than one match for any regex that means the word contains more than one letter in the same block

# Code
```js
const letterBlocks = {
  B: 'O', X: 'K', D: 'Q', C: 'P',
  N: 'A', G: 'T', R: 'E', F: 'S',
  J: 'W', H: 'U', V: 'I', L: 'Y',
  Z: 'M', O: 'B', K: 'X', Q: 'D',
  P: 'C', A: 'N', T: 'G', E: 'R',
  S: 'F', W: 'J', U: 'H', I: 'V',
  Y: 'L', M: 'Z'
};

function isBlockWord(word) {
  let upperCased = word.toUpperCase()
  let used = []

  for (let i = 0; i < word.length; i += 1) {
    if (used.includes(upperCased[i])) {
      return false
    } else {
      used.push(upperCased[i])
      used.push(letterBlocks[upperCased[i]])
    }
  }
  
  return true;
}
```

Alternative1:
```js
function isBlockWord(word) {
  const blocks = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM'];
  const letters = word.split('');

  for (let i = 0; i < letters.length; i += 1) {
    let matchingBlock = blocks.filter(block => block.includes(letters[i].toUpperCase()))[0];

    if (matchingBlock === undefined) {
      return false;
    } else {
      blocks.splice(blocks.indexOf(matchingBlock), 1);
    }
  }

  return true;
}
```

Alternative 2:
```js
function isBlockWord(word) {
  const blocks = ['B:O', 'X:K', 'D:Q', 'C:P', 'N:A', 'G:T', 'R:E', 'F:S', 'J:W', 'H:U', 'V:I', 'L:Y', 'Z:M'];
  const regExps = blocks.map(block => new RegExp(block.replace(':', '|'), 'gi'));

  return regExps.every(regExp => (word.match(regExp) || []).length < 2);
}
```