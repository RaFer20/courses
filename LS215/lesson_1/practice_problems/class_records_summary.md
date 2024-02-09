# Class Records Summary
At the end of each term, faculty members need to prepare a class record summary for students based on the weighted scores of exams and exercises. In this practice problem, we will prepare one such summary from some provided student records.

*Exams and Exercises*
| **Grading Area** | **Weight** |
|------------------|-----------:|
|       Exam       |     65%    |
|     Exercises    |     35%    |

Each term has four exams, and several exercises. Every exam has a fixed maximum score of 100, while exercises have varied maximum score values and counts. The total maximum point value for all exercises in any term is always 100, regardless of how many exercises the students had to complete. For example, a term may have five exercises with possible score maximums of [30, 20, 10, 20, 20] while another term may have three exercises with possible score maximums of [20, 30, 50].

To determine a student's grade, we first determine the student's average score from the four exams, then sum all the exercise scores. We then apply the weights to compute the student's final percent grade. Finally, we determine the letter equivalent grade from the student's percent grade we just computed.

| **Percent Grade** | **Letter Equivalent** |
|------------------:|----------------------:|
|      93 - 100     |           A           |
|      85 - 92      |           B           |
|      77 - 84      |           C           |
|      69 - 76      |           D           |
|      60 - 68      |           E           |
|       0 - 59      |           F           |

For example, let's assume a term with three exercises with maximum scores of [20, 30, 50]. A student got [90, 80, 95, 71] on her four exams, and [20, 15, 40] on her exercises. To determine her final grade, we follow these steps:

1. Compute the student's average exam score: (90 + 80 + 95 + 71) / 4 = 84
2. Compute the student's total exercise score: 20 + 15 + 40 = 75
3. Apply weights to determine the final percent grade: 84 * .65 + 75 * .35 = 80.85
4. Round the percent grade to the nearest integer: 81
5. Lookup the letter grade in the table above: C
6. Combine the percent grade and letter grade: "81 (C)"

*Source Data and Class Record Summary Format*
We store the student data in an object that looks like this:
```js
let studentScores = {
  student1: {
    id: <idNumber>,
    scores: {
      exams: [],
      exercises: [],
    },
  },
  student2: {
    id: <idNumber>,
    scores: {
      exams: [],
      exercises: [],
    },
  },
  student3: {
    id: <idNumber>,
    scores: {
      exams: [],
      exercises: [],
    },
  },
  studentN: {
    id: <idNumber>,
    scores: {
      exams: [],
      exercises: [],
    },
  },
};
```
The output class record summary should look like this:
```js
{
  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
}
```
Round the exam averages to one digit after the decimal point.

*Function Requirements*
Given this information, implement a function that takes a studentScores object and returns a class record summary object.

You can use the following code to test your implementation:
```js
let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function generateClassRecordSummary(scores) {
  // ...
}

generateClassRecordSummary(studentScores);

// returns:
{
  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
}
```

## Solution
```js
function generateClassRecordSummary(scores) {
  let scoreData = Object.keys(scores).map(student => scores[student].scores);
  let examData = scoreData.map(score => score.exams);

  return {
    studentGrades: scoreData.map(scoreObj => getStudentScore(scoreObj)),
    exams: getExamSummary(examData),
  };
}

function getStudentScore(scoreObj) {
  let percentGrade = computeFinalGrade(scoreObj);
  let letterGrade = getLetterGrade(percentGrade);
  return `${percentGrade} (${letterGrade})`;
}

function computeFinalGrade(scoreObj) {
  const EXAM_WEIGHT = .65;
  const EXERCISE_WEIGHT = .35;

  let examGrade = computeExamScore(scoreObj.exams);
  let exerciseGrade = computeExerciseScore(scoreObj.exercises);

  let finalGrade = Math.round(examGrade * EXAM_WEIGHT + exerciseGrade * EXERCISE_WEIGHT);

  return finalGrade;
}

function computeExamScore(examScores) {
  const EXAMS = 4;
  let examSum = examScores.reduce((total, grade) => total + grade);
  let examGrade = examSum / EXAMS;

  return examGrade;
}

function computeExerciseScore(exerciseScores) {
  let exerciseSum = exerciseScores.reduce((total, grade) => total + grade);

  return exerciseSum;
}

function getLetterGrade(grade) {
  if (grade >= 93 && grade < 100) {
    return 'A';
  } else if (grade >= 85 && grade < 93) {
    return 'B';
  } else if (grade >= 77 && grade < 85) {
    return 'C';
  } else if (grade >= 69 && grade < 77) {
    return 'D';
  } else if (grade >= 60 && grade < 69) {
    return 'E';
  } else if (grade >= 0 && grade < 60) {
    return 'F';
  } else {
    return 'Invalid Grade';
  }
}
function getExamSummary(examData) {
  let students = examData.length;
  let average;
  let minimum;
  let maximum;
  const ExamSummary = []

  for (let exam = 0; exam < 4; exam += 1) {
    let score;
    average = 0;
    minimum = 100;
    maximum = 0;
    for (let student = 0; student <= (students - 1); student += 1) {
      score = examData[student][exam]

      average += score
      if (score < minimum) {minimum = score}
      if (score > maximum) {maximum = score}
    }
    average = average / students

    ExamSummary.push({average: average, minimum: minimum, maximum: maximum,})
  }
  
  return ExamSummary;
}
```

Alternative:
```js
function generateClassRecordSummary(scores) {
  let scoreData = Object.keys(scores).map(student => scores[student].scores);
  let examData = scoreData.map(score => score.exams);

  return {
    studentGrades: scoreData.map(scoreObj => getStudentScore(scoreObj)),
    exams: getExamSummary(examData),
  };
}

function getStudentScore(scoreObj) {
  let lookupLetter = function (percentageGrade) {
    if (percentageGrade >= 93) {
      return 'A';
    } else if (percentageGrade >= 85 && percentageGrade < 93) {
      return 'B';
    } else if (percentageGrade >= 77 && percentageGrade < 85) {
      return 'C';
    } else if (percentageGrade >= 69 && percentageGrade < 77) {
      return 'D';
    } else if (percentageGrade >= 60 && percentageGrade < 69) {
      return 'E';
    } else {
      return 'F';
    }
  };

  let examsAvg = computeExamsAverage(scoreObj.exams);
  let exercisesSum = computeExercisesScore(scoreObj.exercises);
  let percentageGrade = Math.round(examsAvg * 0.65 + exercisesSum * 0.35);

  return String(percentageGrade) + ' (' + lookupLetter(percentageGrade) + ')';
}

function computeExamsAverage(exams) {
  return exams.reduce((total, score) => total + score) / exams.length;
}

function computeExercisesScore(exercises) {
  return exercises.reduce((total, score) => total + score);
}

function getExamSummary(examScoresPerStudent) {
  let scoresPerExam = transpose(examScoresPerStudent);

  return scoresPerExam.map(examScores => {
    return {
      average: parseFloat(getExamAverage(examScores)),
      minimum: getExamMinimum(examScores),
      maximum: getExamMaximum(examScores),
    };
  });
}

function transpose(array) {
  return array[0].map((col, columnIdx) => {
    return array.map(row => row[columnIdx]);
  });
}

function getExamAverage(scores) {
  return (scores.reduce((total, score) => total + score) / scores.length)
            .toFixed(1);
}

function getExamMinimum(scores) {
  return scores.reduce((min, score) => (min <= score ? min : score));
}

function getExamMaximum(scores) {
  return scores.reduce((max, score) => (max >= score ? max : score));
}
```