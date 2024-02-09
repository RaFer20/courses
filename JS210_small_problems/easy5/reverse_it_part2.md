# Reverse It Part 2
Write a function that takes a string argument containing one or more words and returns a new string containing the words from the string argument. All five-or-more letter words should have their letters in reverse order. The string argument will consist of only letters and spaces. Words will be separated by a single space.

Examples:
```js
reverseWords('Professional');             // "lanoisseforP"
reverseWords('Walk around the block');    // "Walk dnuora the kcolb"
reverseWords('Launch School');            // "hcnuaL loohcS"
```


## Solution
```js
function reverseWords(string) {
  const wordArr = string.split(' ')
  const reversedArr = [];
  
  for (word of wordArr) {
    if (word.length >= 5) {
      word = word.split('').reverse().join('')
    }
    reversedArr.push(word);
  }

  return  reversedArr.join(' ');
}
```
