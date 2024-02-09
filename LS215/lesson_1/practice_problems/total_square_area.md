# Total Square Area
For this practice problem, we'll represent rectangles as Arrays with two elements: a height and a width.

Write a Function named `totalArea` that takes an Array of rectangles as an argument. The Function should return the total area covered by all the rectangles.
```js
let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

totalArea(rectangles);    // 141
```

Solution:
```js
function totalArea(arrayOfRectangles) {
  let areas = arrayOfRectangles.map((rectangle) => rectangle[0] * rectangle[1]);
  return areas.reduce((accum, currVal) => accum + currVal);
}
```

Now, write a second Function named `totalSquareArea`. This Function should calculate the total area of a set of rectangles, just like `totalArea`. However, it should only include squares in its calculations: it should ignore rectangles that aren't square.

```js
let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

totalSquareArea(rectangles);    // 121
```

## Solution:
```js
function totalSquareArea(arrayOfRectangles) {
  let areas = arrayOfRectangles.filter((array) => array[0] === array[1]);
  return totalArea(areas);
}
```
