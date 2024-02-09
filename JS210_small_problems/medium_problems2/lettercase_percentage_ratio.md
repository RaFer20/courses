Write a function that takes a string and returns an object containing the following three properties:

- the percentage of characters in the string that are lowercase letters
- the percentage of characters that are uppercase letters
- the percentage of characters that are neither
You may assume that the string will always contain at least one character.

Examples:
```js
letterPercentages('abCdef 123');
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

letterPercentages('AbCd +Ef');
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

letterPercentages('123');
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
```

# Problem
Input: String
Output: objects, key-value pair are percentages for lowercase, uppercase and neither respectively
String will always contain at least one character
percent values contain two decimal points


# Examples/Test Cases
```js
letterPercentages('abCdef 123');
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

letterPercentages('AbCd +Ef');
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

letterPercentages('123');
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
```

# Data Structures
object

# Algorithm
initialize an object with 3 entries to `0`
initialize a `totalChars` variable to the length of string

start a for loop and iterate over the indices of the input string
- if character matches for lowercase increase the counter in the object by 1
- if character matches for uppercase increase the counter in the object by 1
- else character is neither, increase the counter in the object by 1

start a for...in loop to calculate percentages and fix to two decimal points
- value/totalChars * 100
return letters

# Code
```js
function letterPercentages(string) {
  let letters = {lowercase: 0,
                 uppercase: 0,
                 neither: 0,
                }
  let totalChars = string.length;
  
  for (i = 0; i < totalChars; i += 1) {
    if ((/[a-z]/).test(string[i])) {
      letters['lowercase'] += 1;
    } else if (/[A-Z]/.test(string[i])) {
      letters['uppercase'] += 1;
    } else {
      letters['neither'] += 1;
    }
  }

  for (key in letters) {
    letters[key] = ((letters[key] / totalChars) * 100).toFixed(2)
  }

  return letters
}
```

Alternative:
```js
function letterPercentages(string) {
  const count = string.length;
  return {
    lowercase: (((string.match(/[a-z]/g) || []).length / count) * 100).toFixed(2),
    uppercase: (((string.match(/[A-Z]/g) || []).length / count) * 100).toFixed(2),
    neither: (((string.match(/[^a-z]/gi) || []).length / count) * 100).toFixed(2),
  };
}
```