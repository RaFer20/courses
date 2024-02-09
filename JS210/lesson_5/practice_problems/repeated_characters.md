# Repeated Characters
Implement a function that takes a String as an argument and returns an object that contains a count of the repeated characters.

```js
repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }
```
Note that repeatedCharacters does a bit more than simply count the frequency of each character: it determines the counts, but only returns counts for characters that have a count of 2 or more. It also ignores the case.

## Solution
```js
function repeatedCharacters(string) {
  let freqTable = {};
  string = string.toLowerCase();

  for (let i = 0; i < string.length; i++) {
    if (Object.keys(freqTable).includes(string[i].toLowerCase())) {
      freqTable[string[i]] += 1;
    } else {
      freqTable[string[i]] = 1;
    }
  }

 for (let key in freqTable) {
  if (freqTable[key] < 2) {
    delete freqTable[key]
  }
}

  return freqTable;
}
```
