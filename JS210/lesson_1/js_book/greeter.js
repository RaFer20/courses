// let name = 'Gary';
// console.log('Good Morning, ' + name + '.');
// console.log('Good Afternoon, ' + name + '.');
// console.log('Good Evening, ' + name + '.');

// console.log(`My name is ${name}`)

let rlSync = require('readline-sync');
let first_name = rlSync.question('What is your first name?\n');
let last_name = rlSync.question('What is your last name?\n');
console.log(`Hello, ${first_name} ${last_name}`)