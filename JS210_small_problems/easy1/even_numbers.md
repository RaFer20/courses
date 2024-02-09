# Even Numbers
Log all even numbers from `1` to `99`, inclusive, to the console, with each number on a separate line.

## Solution
```js
for (let i = 1; i <= 99; i++) {
  if (i % 2 === 0) {
    console.log(i)
  }
}
```

or

```js
for (let i = 1; i < 100; i += 1) {
  if (i % 2 === 1) {
    continue;
  }

  console.log(i);
}
```