# FizzBuzz
Write a function that iterates over the integers from 1 to 100, inclusive. For multiples of three, log "Fizz" to the console. For multiples of five, log "Buzz". For numbers which are multiples of both three and five, log "FizzBuzz". For all other numbers, log the number.

Your output should look like this:
```js
fizzbuzz();

// console output
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
// … rest of output omitted for brevity
```

## Solution
```js
function fizzbuzz() {
  for (num = 1; num <= 100; num++) {
    if (num % 3 === 0 && num % 5 === 0) {
      console.log('FizzBuzz');
    } else if (num % 3 === 0) {
      console.log('Fizz');
    } else if (num % 5 === 0) {
      console.log('Buzz')
    } else {
      console.log(num)
    }
  }
};
```

## Further Exploration
This solution is more verbose than called for. Can you refactor it to make it more concise?

```js
let fizzbuzz = () => {
  for (let index = 1; index <= 100; index += 1) {
    let message = '';

    if (index % 3 === 0) {
      message += 'Fizz';
    }

    if (index % 5 === 0) {
      message += 'Buzz';
    }

    console.log(message || index);
  }
};
```