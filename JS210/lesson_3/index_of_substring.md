# Index of Substring
Write two functions that each take two strings as arguments. Their expected behaviors are as follows:

- The `indexOf` function searches for the first instance of a substring in `firstString` that matches the string `secondString`, and returns the index of the character where that substring begins.

- The `lastIndexOf` function searches for the last instance of a substring in `firstString` that matches the string `secondString`, and returns the index of the character where that substring begins.

- Both functions return -1 if `firstString` does not contain the substring specified by `secondString`.

Examples
```js
function indexOf(firstString, secondString) {
  // statements
}

function lastIndexOf(firstString, secondString) {
  // statements
}

indexOf('Some strings', 's');                      // 5
indexOf('Blue Whale', 'Whale');                    // 5
indexOf('Blue Whale', 'Blute');                    // -1
indexOf('Blue Whale', 'leB');                      // -1

lastIndexOf('Some strings', 's');                  // 11
lastIndexOf('Blue Whale, Killer Whale', 'Whale');  // 19
lastIndexOf('Blue Whale, Killer Whale', 'all');    // -1
```


## Solution
```js
function indexOf(firstString, secondString) {
  if (!firstString.includes(secondString)) {
    return -1
  }

  let m = firstString.length;
  let n = secondString.length;

  for (let i = 0; i <= (m - n); i++) {
    if (firstString[i] === secondString[0]) {
      if (firstString.substring(i, (i + n)) === secondString) {
        return i
      }
    }
  }
}

function lastIndexOf(firstString, secondString) {
  if (!firstString.includes(secondString)) {
    return -1
  }

  let m = firstString.length;
  let n = secondString.length;

  for (let i = (m - n); i >= 0; i++) {
    if (firstString[i] === secondString[0]) {
      if (firstString.substring(i, (i + n)) === secondString) {
        return i
      }
    }
  }
}
```