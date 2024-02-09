A stack is a list of values that grows and shrinks dynamically. A stack may be implemented as an Array that uses two Array methods: Array.prototype.push and Array.prototype.pop.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. An operation that requires two values pops the topmost item from the stack (i.e., the operation removes the most recently pushed value from the stack), operates on the popped value and the register value, and stores the result back in the register.

Consider a MULT operation in a stack-and-register language. It removes the value from the stack, multiplies the removed stack value with the register value, then stores the result back in the register. For example, if we start with a stack of [3, 6, 4] (where 4 is the topmost item in the stack) and a register value of 7, the MULT operation mutates the stack to [3, 6] (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, the stack is mutated to [3], and the register is left with the value 168.

Write a function that implements a miniature stack-and-register-based programming language that has the following commands (also called operations or tokens):

- n : Place a value, n, in the register. Do not modify the stack.
- PUSH : Push the register value onto the stack. Leave the value in the register.
- ADD : Pop a value from the stack and add it to the register value, storing the result in the register.
- SUB : Pop a value from the stack and subtract it from the register value, storing the result in the register.
- MULT : Pop a value from the stack and multiply it by the register value, storing the result in the register.
- DIV : Pop a value from the stack and divide the register value by the popped stack value, storing the integer result back in the register.
- REMAINDER : Pop a value from the stack and divide the register value by the popped stack value, storing the integer remainder of the division back in the register.
- POP : Remove the topmost item from the stack and place it in the register.
- PRINT : Print the register value.

All operations are integer operations (which is only important with DIV and REMAINDER).

Programs will be supplied to your language function via a string argument. Your function may assume that all arguments are valid programs — i.e., they will not do anything like trying to pop a non-existent value from the stack, and they will not contain any unknown tokens.

Initialize the stack and register to the values [] and 0, respectively.

Examples:
```js
minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)
```


# Problem
 A stack may be implemented as an Array that uses two Array methods: Array.prototype.push and Array.prototype.pop.
 Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack.
 Initialize the stack and register to the values [] and 0, respectively.

 Implicit:
 commands in the string will be separated by a space.

 Input: String
 Output: number, unless nothing is printed.

# Examples/Test Cases
```js
minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)
```

# Data Structures
Array

# Algorithm
Initialize the stack `[]` and register `0` variables
split string into an array of elements
loop through the elements of the array, each element is a "command" to do something
- if element is a number `n`, store it in the register
-- make sure to store as a number, not a string
- if element is `push` push the register into the stack
- if element is `pop` pop an element from the stack
- if element is `add`, `sub`, `mult`, `div`, or `remainder` pop a value from the stack and use the register to complete the operation
-- make sure to round divisions to not get decimals
- If element is `print` print the register to the console.
 
# Code
```js
function minilang(string) {
  const stack = [];
  let register = 0;
  let commands = string.split(' ')

  for (i = 0; i < commands.length; i += 1) {
    if (/[0-9]/.test(commands[i])) {
      register = Number(commands[i]);
      continue;
    }

    switch (commands[i]) {
      case 'PUSH':
        stack.push(register);
        break;
      case 'POP':
        register = stack.pop(register);
        break;
      case 'ADD':
        register += stack.pop(register);
        break;
      case 'SUB':
        register -= stack.pop(register);
        break;
      case 'MULT':
        register *= stack.pop(register);
        break;
      case 'DIV':
        register = Math.floor(register / stack.pop(register));
        break;
      case 'REMAINDER':
        register = Math.floor(register % stack.pop(register));
        break;
      case 'PRINT':
        console.log(register);
        break;
    }
  }
}
```

Alternative:
```js
function minilang(program) {
  let register = 0;
  const stack = [];

  program.split(' ').forEach(token => {
    switch (token) {
      case 'ADD':
        register += stack.pop();
        break;
      case 'DIV':
        register = Math.floor(register / stack.pop());
        break;
      case 'REMAINDER':
        register = Math.floor(register % stack.pop());
        break;
      case 'MULT':
        register *= stack.pop();
        break;
      case 'SUB':
        register -= stack.pop();
        break;
      case 'PUSH':
        stack.push(register);
        break;
      case 'POP':
        register = stack.pop();
        break;
      case 'PRINT':
        console.log(register);
        break;
      default:
        register = parseInt(token, 10);
    }
  });
}
```