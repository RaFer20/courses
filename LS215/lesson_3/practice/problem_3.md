# Problem Description
A collection of spelling blocks has two letters per block, as shown in this list:

```
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
```
This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

Examples:
```js
isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true
```

# Understanding the Problem
input: string
output: boolean

consider letters case-insensitive
each block can only be used once

# Examples/Test Cases
```js
console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('jeff'));       // false
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