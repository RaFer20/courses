# Staggered Caps Part 2
Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

Examples:
```js
staggeredCase('I Love Launch School!');        // "I lOvE lAuNcH sChOoL!"
staggeredCase('ALL CAPS');                     // "AlL cApS"
staggeredCase('ignore 77 the 444 numbers');    // "IgNoRe 77 ThE 444 nUmBeRs"
```

## Solution
```js
function staggeredCase(string) {
  let newStr = '';
  let swap = true;
  for (let i = 0; i < string.length; i += 1) {
    if ((/[^a-z]/i).test(string[i])) {
      newStr += string[i];
      continue;
    }

    if (swap) {
      newStr += string[i].toUpperCase();
    } else {
      newStr += string[i].toLowerCase();
    }
    swap = !swap;
  }

  return newStr;
}
```

Alternative:
```js
function staggeredCase(string) {
  let needUpper = true;
  let newChar;

  return string.split('').map(char => {
    if (char.match(/[a-z]/i)) {
      if (needUpper) {
        newChar = char.toUpperCase();
      } else {
        newChar = char.toLowerCase();
      }

      needUpper = !needUpper;
      return newChar;
    } else {
      return char;
    }
  }).join('');
}
```