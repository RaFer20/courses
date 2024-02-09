# Name Swapping
Write a function that takes a string argument consisting of a first name, a space, and a last name, and returns a new string consisting of the last name, a comma, a space, and the first name.

Examples:
```js
swapName('Joe Roberts');    // "Roberts, Joe"
```


## Solution
```js
function swapName(fullName) {
  const names = fullName.split(' ').reverse()
  return `${names[0]}, ${names[1]}`
}
```