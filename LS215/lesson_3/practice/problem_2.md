# Problem Description
The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

- Counting from the rightmost digit and moving left, double the value of every second digit
- For any digit that thus become 10 or more, subtract 9 from the result
-- 1111 becomes 2121
-- 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)

- Add all these digits together
-- 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
-- 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20

If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.

# Understanding the Problem
Input: number
Output: boolean?


# Examples/Test Cases
function(2323 2005 7766 3554)   => 60 => "valid"
function(1111)                  => 6  => "invalid"

# Data Structuce
Array of numbers

# Algorithm
Replace non-numbers characters in the input string with empty spaces
Reverse the array and map the numbers from right to left doubling every second number
- if the number goes becomes 10 or larger subtract 9 from the result
Reduce the numbers into a sum of the numbers in the array
- If the result of reduce ends with a `0` the numbers is valid
- else it is invalid

# Code
```js
function validate(numString) {
  let nums = numString.replace(/\D/g, '').split('').reverse();
  let newNums = nums.map((element, idx, arr) => {
    if (idx % 2 === 1) {
      if (element * 2 >= 10) {
        return (element * 2) - 9;
      } else {
        return element * 2;
      }
    } else {
      return Number(element);
    }
  })
  let checksum = newNums.reduce((sum, num) => sum + num, 0)
  return (checksum % 10 === 0)
}

console.log(validate('2323 2005 7766 3554'))   //=> 60 => "valid"
console.log(validate('1111'))                  //=> 6  => "invalid"
console.log(validate('1111asd12!!!'))          //=> 10 => "valid"  
```

# Extra requirement
Write a function that can add a check digit to make the number valid per the Luhn formula and return the original number plus that digit. This should give '2323 2005 7766 3554' in response to '2323 2005 7766 355'.

```js
function makeValid(numString) {
  if (validate(numString)) return numString;

  for (let i = 0; i <= 9; i += 1) {
    let testing = numString + String(i);
    
    if (validate(testing)) return testing;
  }
}
```