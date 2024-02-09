# Odd Numbers
Log all odd numbers from `1` to `99`, inclusive, to the console, with each number on a separate line.

## Solution
```js
for (let i = 1; i < 100; i += 2) {
  console.log(i)
}
```

## Further exploration
Repeat this exercise with a technique different from the one that you used, and different from the one provided. Also consider adding a way for the user to specify the limits of the odd numbers logged to the console.

```js
let i = 1
while (i < 99) {
  console.log(i)
  i += 2
}
```