# Student Grade
Write a program to determine a student’s grade based on the average of three scores you get from the user. Use these rules to compute the grade:

- If the average score is greater than or equal to 90 then the grade is 'A'
- If the average score is greater than or equal to 70 and less than 90 then the grade is 'B'
- If the average score is greater than or equal to 50 and less than 70 then the grade is 'C'
- If the average score is less than 50 then the grade is 'F'
You may assume that all input values are valid positive integers.

Example
```js
// prompts to get the 3 scores
Enter score 1: 90
Enter score 2: 50
Enter score 3: 78

// log to the console
Based on the average of your 3 scores your letter grade is "B".
```

## Solution
see `student_grade.html`
```js
let score1 = Number(prompt('Enter score 1:'));
let score2 = Number(prompt('Enter score 2:'));
let score3 = Number(prompt('Enter score 3:'));
let total = score1 + score2 + score3;
let average = total / 3;

let grade = 'F';
if (average >= 90) {
  grade = 'A';
} else if (average >= 70) {
  grade = 'B';
} else if (average >= 50) {
  grade = 'C';
}

console.log('Based on the average of your 3 scores your letter grade is "' +
            grade + '".');
```

## Further Exploration
Our solution limits us to exactly three input scores. Modify it to accept any number of scores. To simplify matters, move the computation of the average into a function.

```js
function calculateAverage(scores) {
  let sum = scores.reduce((accum, value) => accum + value, 0);
  let average = sum/scores.length
  return average
}

let amount = Number(prompt('How many scores will you enter?'))
let scoresArray = []
for (let i = 0; scoresArray.length < amount; i++) {
  score = Number(prompt(`Enter score ${i + 1}:`));
  scoresArray.push(score)
}

let average = calculateAverage(scoresArray)

let grade = 'F';
if (average >= 90) {
  grade = 'A';
} else if (average >= 70) {
  grade = 'B';
} else if (average >= 50) {
  grade = 'C';
}

console.log('Based on the average of your 3 scores your letter grade is "' +
            grade + '".');
```