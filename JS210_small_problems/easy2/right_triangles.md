Write a function that takes a positive integer, n, as an argument and logs a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:
```js
triangle(5);

    *
   **
  ***
 ****
*****

triangle(9);

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
```

## Solution
```js
function triangle(n) {
  let line = ' '.repeat(n);
  for (let i = n; i >= 0; i--) {
    line = ' '.repeat(i) + '*'.repeat(n - i);
    console.log(line);
  }
}
```