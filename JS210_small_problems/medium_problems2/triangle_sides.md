A triangle is classified as follows:

- Equilateral: All three sides are of equal length.
- Isosceles: Two sides are of equal length, while the third is different.
- Scalene: All three sides are of different lengths.
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and every side must have a length greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the lengths of the three sides of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'equilateral', 'isosceles', 'scalene', or 'invalid'.

Examples:
```js
triangle(3, 3, 3);        // "equilateral"
triangle(3, 3, 1.5);      // "isosceles"
triangle(3, 4, 5);        // "scalene"
triangle(0, 3, 3);        // "invalid"
triangle(3, 1, 1);        // "invalid"
```

# Problem
Input: 3 numbers
Output: triangle classification or invalid (string)
the two smaller sides must be greater than the length of the longest side
every side must have a length greater than 0

all sides equal === equilateral
two sides equal, 3rd different === isosceles
three sides different === scalene


# Examples/Test Cases
```js
triangle(3, 3, 3);        // "equilateral"
triangle(3, 3, 1.5);      // "isosceles"
triangle(3, 4, 5);        // "scalene"
triangle(0, 3, 3);        // "invalid"
triangle(3, 1, 1);        // "invalid"
```

# Data Structures
Array

# Algorithm
Initialize a variable for every number in the input (min, mid, max)
return invalid is min + mind <= max or if any of the sides is 0
initialize an empty array with only unique numbers from the input and get its length
- if length === 1 return 'equilateral'
- if length === 2 return 'isosceles'
- else return 'scalene'

# Code
```js
function triangle(n1, n2, n3) {
  const argArray = Array.from(arguments)
  const min = argArray.sort()[0];
  const mid = argArray.sort()[1];
  const max = argArray.sort()[2];
  if (!argArray.every((n) => n > 0) || (min + mid) <= max) {
    return 'invalid'
  }

  const sides = [];

  for (i = 0; i < argArray.length; i += 1) {
    if (!sides.includes(argArray[i])) {
      sides.push(argArray[i])
    }
  }

  if (sides.length === 1) {
    return 'equilateral';
  } else if (sides.length === 2) {
    return 'isosceles';
  } else {
    return 'scalene';
  }
}
```

Alternative:
```js
function triangle(side1, side2, side3) {
  const perimeter = side1 + side2 + side3;
  const longest = Math.max(side1, side2, side3);
  const shortest = Math.min(side1, side2, side3);
  const middle = perimeter - longest - shortest;

  if (isValid(shortest, middle, longest)) {
    return getTriangleType(side1, side2, side3);
  } else {
    return 'invalid';
  }
}

function isValid(shortest, middle, longest) {
  return shortest > 0 && (shortest + middle > longest);
}

function getTriangleType(side1, side2, side3) {
  if (side1 === side2 && side2 === side3) {
    return 'equilateral';
  } else if (side1 === side2 || side1 === side3 || side2 === side3) {
    return 'isosceles';
  } else {
    return 'scalene';
  }
}
```