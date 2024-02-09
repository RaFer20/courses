# Anagrams
Write a Function named `anagram` that takes two arguments: a word and an array of words. Your function should return an array that contains all the words from the array argument that are anagrams of the word argument. For example, given the word "listen" and an array of candidate words like "enlist", "google", "inlets", and "banana", the program should return an array that contains "enlist" and "inlets".

Examples:
```js
function anagram(word, list) {
  // ...
}

anagram('listen', ['enlists', 'google', 'inlets', 'banana']);  // [ "inlets" ]
anagram('listen', ['enlist', 'google', 'inlets', 'banana']);   // [ "enlist", "inlets" ]
```


## Solution
```js
function anagram(word, list) {
  return list.filter(candidate => {
    return word.split('').sort().toString() === word.split('').sort().toString();
  });
}
```

Aternative 1:
```js
function anagram(word, list) {
  return list.filter(candidate => areAnagrams(candidate, word));
}

function areAnagrams(source, target) {
  let sourceLetters = source.split('').sort();
  let targetLetters = target.split('').sort();
  return compareArrays(sourceLetters, targetLetters);
}

function compareArrays(array1, array2) {
  return array1.toString() === array2.toString();
}
```

Aternative 2:
```js
function anagram(word, list) {
  return list.filter(candidate => areAnagrams(candidate, word));
}

function areAnagrams(source, target) {
  let sourceLetters = source.split('').sort();
  let targetLetters = target.split('').sort();
  return compareArrays(sourceLetters, targetLetters);
}

function compareArrays(array1, array2) {
  if (array1.length !== array2.length) {
    return false;
  }

  return array1.every((letter, index) => letter === array2[index]);
}
```