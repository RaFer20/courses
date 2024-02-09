Write a function that takes a sentence string as an argument and returns that string with every occurrence of a "number word" — 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' — converted to its corresponding digit character.

Example:
```js
wordToDigit('Please call me at five five five one two three four. Thanks.');
// "Please call me at 5 5 5 1 2 3 4. Thanks."
```

# Problem
replace "word numbers" in the input string with their digit equivalents

Input: string
Output: string with word numbers transformed to their digit equivalents

# Examples/Test Cases
```js
wordToDigit('Please call me at five five five one two three four. Thanks.');
// "Please call me at 5 5 5 1 2 3 4. Thanks."

wordToDigit('three five six 8');
// "3 5 6 8"

wordToDigit('Hello, World!');
// "Hello, World!"
```

# Data Structure
Array

# Algorithm
Initialize an object with the word numbers as keys and their respective digits as values

wordToDigit()
split string into array of elements
map through the array
- if key exists in `NUMBERS` then transform it to its digit counterpart
- else just leave it as is
join the array with a space in between every elements
return the new string


# Code
```js
const NUM_WORDS = {
  zero:  0,
  one:   1,
  two:   2,
  three: 3,
  four:  4,
  five:  5,
  six:   6,
  seven: 7,
  eight: 8,
  nine:  9,
};

function wordToDigit(sentence) {
  Object.keys(NUM_WORDS).forEach(word => {
    let regex = new RegExp('\\b' + word + '\\b', 'g');     // handles cases where a "number" 
    sentence = sentence.replace(regex, NUM_WORDS[word]);   // might be part of a word like "done" or "weight"
  });
  console.log(sentence)
  return sentence;
}
```