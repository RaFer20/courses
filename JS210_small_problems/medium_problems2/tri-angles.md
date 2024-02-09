A triangle is classified as follows:

- Right: One angle is a right angle (exactly 90 degrees).
- Acute: All three angles are less than 90 degrees.
- Obtuse: One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and every angle must be greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the three angles of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'right', 'acute', 'obtuse', or 'invalid'.

You may assume that all angles have integer values, so you do not have to worry about floating point errors. You may also assume that the arguments are in degrees.

Examples:
```js
triangle(60, 70, 50);       // "acute"
triangle(30, 90, 60);       // "right"
triangle(120, 50, 10);      // "obtuse"
triangle(0, 90, 90);        // "invalid"
triangle(50, 50, 50);       // "invalid"
```

# Problem
Write a function that takes three angles and returns the classification of the triangle
all angles are integer values in degrees
the sum of all angles must be 180 and every angle must be greater than 0 else it is an invalid triangle

# Examples/Test Cases
```js
triangle(60, 70, 50);       // "acute"
triangle(30, 90, 60);       // "right"
triangle(120, 50, 10);      // "obtuse"
triangle(0, 90, 90);        // "invalid"
triangle(50, 50, 50);       // "invalid"
```

# Data Structures
Array

# Algorithm
return invalid if angle1 + angle2 + angle3 !== 180 OR either angle is 0 or less
initialize array with angles
- if every() angle is less than 90 return acute
- if any() angle is more than 90 return obtuse
- else return right

# Code
```js
function triangle(angle1, angle2, angle3) {
  const angles = [angle1, angle2, angle3];
  if ((angle1 + angle2 + angle3) !== 180) {
    return 'invalid';
  } else if (angle1 <= 0 || angle2 <= 0 || angle3 <= 0) {
    return 'invalid';
  }

  return getTriangleType(angles);
}

function getTriangleType(anglesArray) {
  if (anglesArray.every((angle) => angle < 90)) {
    return 'acute';
  } else if (anglesArray.some((angle) => angle > 90)) {
    return 'obtuse';
  } else {
    return 'right';
  }
}
```

Alternative:
```js
function triangle(angle1, angle2, angle3) {
  const angles = [angle1, angle2, angle3];
  if (isValid(angles)) {
    return getTriangleType(angles);
  } else {
    return "invalid";
  }
}

function isValid(angles) {
  const totalAngle = angles.reduce((total, angle) => total + angle);

  const allNonZero = angles.every(angle => angle > 0);

  return totalAngle === 180 && allNonZero;
}

function getTriangleType(angles) {
  if (angles.some(testRightTriangle)) {
    return "right";
  } else if (angles.every(testAcuteTriangle)) {
    return "acute";
  } else {
    return "obtuse";
  }
}

function testRightTriangle(angle) {
  return angle === 90;
}

function testAcuteTriangle(angle) {
  return angle < 90;
}
```
**Note that we do not use parentheses when passing the functions as arguments -- the some and every function will take care of invoking the functions. We just want to pass the functions in to them.**