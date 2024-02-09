// let rlSync = require('readline-sync');
// let age = rlSync.question('How old are you??\n');
// age = parseInt(age);
// console.log(`You are ${age} years old.`)
// console.log(`In 10 years, you will be ${age + 10} years old.`)
// console.log(`In 20 years, you will be ${age + 20} years old.`)
// console.log(`In 30 years, you will be ${age + 30} years old.`)
// console.log(`In 40 years, you will be ${age + 40} years old.`)

let readlineSync = require('readline-sync');
let age = readlineSync.question('How old are you? ');
age = parseInt(age);
console.log(`You are ${age} years old.`);
for (let time = 10; time <= 40; time += 10) {
  console.log(`In ${time} years, you will be ${age + time} years old.`);
}