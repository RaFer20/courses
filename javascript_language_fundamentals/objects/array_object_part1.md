# Array Object Part 1
What will the following code log to the console and why? Don't run the code until after you have tried to answer.
```js
const myArray = ['a', 'b', 'c'];

console.log(myArray[0]);
console.log(myArray[-1]);

myArray[-1] = 'd';
myArray['e'] = 5;
myArray[3] = 'f';

console.log(myArray[-1]);
console.log(myArray['e']);
console.log(myArray);
```

## Solution
line 3 will log `'a'`
line 4 will log undefined since there is no `-1` index or key.
line 10 will log `'d'` since now there is a `-1` key in `myArray`
line 11 will log `5` since that is the value of the `'e'` key
line 12 will log `[ 'a', 'b', 'c', 'f', '-1': 'd', e: 5 ]`
