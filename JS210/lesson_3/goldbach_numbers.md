# Goldbach Numbers
Write a function named `checkGoldbach` that uses Goldbach's Conjecture to log every pair of primes that sum to the number supplied as an argument. The conjecture states that "you can express every even integer greater than 2 as the sum of two primes". The function takes as its only parameter, an integer `expectedSum`, and logs all combinations of two prime numbers whose sum is `expectedSum`. Log the prime pairs with the smaller number first. If `expectedSum` is odd or less than 4, your function should log null.

Your checkGoldbach function may call the isPrime function you wrote for a previous practice problem.

Example
```js
checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53
```

# Solution
```js
function isPrime(number) {
  if (number <= 1 || (number > 2 && number % 2 === 0)) {
    return false;
  }

  let divisor = 3;

  while (divisor < number) {
    if (number % divisor === 0) {
      return false;
    }

    divisor += 2;
  }

  return true;
}

function checkGoldbach(expectedSum) {
  if (expectedSum % 2 === 1 || expectedSum < 4) {
    return console.log(null)
  }

  for (let firstNumber = 2; firstNumber < expectedSum/2; firstNumber += 1) {
  let secondNumber = expectedSum - firstNumber;
  if (isPrime(firstNumber) && isPrime(secondNumber)) {
    console.log(`${firstNumber} + ${secondNumber}`)
    }
  } 
}

```