# for/in and for/of
The for/in statement iterates over all enumerable properties of an object including any properties inherited from another object. 
```js
let obj = { foo: 1, bar: 2, qux: 'c' };
for (let key in obj) {
  console.log(key);
}
// Output:  foo
//          bar
//          qux
```

**Dont' use `for/in` to iterate over an array, it will iterate over the index values.**
```js
let arr = [ 10, 20, 30 ]
for (let value in arr) {
  console.log(value);
}
// Output:  0
//          1
//          2
```

A more direct way to iterate over the values in an array is to use `for/of`:
```js
let arr = [ 10, 20, 30 ]
for (let value of arr) {
  console.log(value);
}
// Output:  10
//          20
//          30
```
`for/of` is similar to `for/in`, but it iterates over the values of any "iterable" collection.
Passing a string to for/of:
```js
let str = "abc";
for (let char of str) {
  console.log(char);
}
// Output: a
//         b
//         c
```

# Method Chaining
The main takeaway is that you can call a method on the return value of another method.
Example: 
```js
let str = 'Pete Hanson';
let names = str.toUpperCase().split(' ').reverse().join(', ');
console.log(names); // => HANSON, PETE
```

We'll also see several syntactic variations on this code:
```js
let str = 'Pete Hanson';
let names = str.toUpperCase()
               .split(' ')
               .reverse()
               .join(', ');
console.log(names);
//////////////////////////////
let str = 'Pete Hanson';
let names = str.toUpperCase()
  .split(' ')
  .reverse()
  .join(', ');
console.log(names);
//////////////////////////////
let str = 'Pete Hanson';
let names = str.toUpperCase().
                split(' ').
                reverse().
                join(', ');
console.log(names);
```

# Regex
A regular expression -- a regex -- is a sequence of characters that you can use to test whether a string matches a given pattern. 

JavaScript uses RegExp objects to store regex: note the spelling and case. Like other objects, RegExp objects can invoke methods. The method test, for instance, returns a boolean value based on whether a string argument matches the regex. Here's how we can use test to determine whether the string "bobcat" contains the letter o or l:
```js
> /o/.test('bobcat')
= true

> /l/.test('bobcat')
= false
```

You can use these boolean values to perform some operation depending on whether a match occurs:
```js
if (/b/.test('bobcat')) {
  // this branch executes since 'b' is in 'bobcat'
  console.log("Yes, it contains the letter 'b'");
} else {
  // this branch does not execute since 'bobcat' contains 'b'
  console.log("No, it doesn't contain the letter 'b'");
}
```

Boolean values sometimes don't provide enough information about a match. That's when the match method for strings comes in handy. This method takes a regex as the argument and returns an array that describes the match.
```js
> "bobcat".match(/x/)         // No match
= null

> "bobcat".match(/[bct]/g)    // Global match
= [ 'b', 'b', 'c', 't' ]

> "bobcat".match(/b((o)b)/)   // Singular match with groups
= [ 'bob', 'ob', 'o', index: 0, input: 'bobcat', groups: undefined ]
```
When `/g` isn't present, the return value for a successful match is also an array, but it includes some additional properties:
- index: the index within the string where the match begins
- input: a copy of the original string
- groups: used for "named groups" 

Match returns null when a match doesn't occur. You can harness this in conditionals:
```js
function has_a_or_e(string) {
  let results = string.match(/[ae]/g);
  if (results) {
    // a non-null return value from match is truthy
    console.log(`We have a match! ${results}`);
  } else {
    // a null return value from match is falsy
    console.log('No match here.');
  }
}

has_a_or_e("basketball"); // => We have a match! a,e,a
has_a_or_e("football");   // => We have a match! a
has_a_or_e("hockey");     // => We have a match! e
has_a_or_e("golf");       // => No match here.
```

*Since `match` must generate information above and beyond a simple boolean value, it can have performance and memory costs. `test` is more efficient, so try to use it when you don't need to know anything other than whether the regex matched the string.*

# The Math Object
The JavaScript `Math` object provides a collection of methods and values that you can use without a complete understanding of how they work.

Let's say you want to calculate the square root of a number. It's possible to design and implement an algorithm that calculates the root. Why bother, however? JavaScript's `Math` object has a method named `sqrt` that you can use without first designing, writing, and testing some code:
```js
> Math.sqrt(36)
= 6

> Math.sqrt(2)
= 1.4142135623730951
```

```js
> Math.PI
= 3.141592653589793
```

# Dates
Suppose you want to determine the day of the week that December 25 occurred on in 2012. 
JavaScript's Date constructor creates objects that represent a time and date. The objects provide methods that let you work with those values. In particular, it's not hard to determine the day of the week that corresponds to a date:
```js
> let date = new Date('December 25, 2012')
> date.getDay()
= 2
```
`getDay` returns a number for the day of the week: 0 represents Sunday, 1 represents Monday, and so on. In this case, we see that December 25, 2012, occurred on a Tuesday.

Getting a day name takes a bit more work, but it's not difficult:
```js
function getDayOfWeek(date) {
  let daysOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  return daysOfWeek[date.getDay()];
}

let date = new Date('December 25, 2012');
console.log(getDayOfWeek(date)); // => Tuesday
```

# Exceptions
Not all errors in JavaScript are silent. There are some situations where JavaScript is less forgiving; that's where exceptions come into play. In such cases, JavaScript raises an error, or throws an exception, then halts the program if the program does not catch the exception.

Exception handling is a process that deals with errors in a manageable and predictable manner. 
JavaScript's `try/catch` statement provides the means to handle exceptions. The basic structure looks like this:

```js
try {
  // perform an operation that may produce an error
} catch (exception) {
  // an error occurred. do something about it.
  // for example, log the error
} finally {
  // Optional 'finally' block; not used often
  // Executes regardless of whether an exception occurs.
}
```

One common JavaScript error occurs when we call a method on the values `undefined` or `null`.
```js
let names = ['bob', 'joe', 'steve', undefined, 'frank'];
names.forEach(name => {
  console.log(`${name}'s name has ${name.length} letters in it.`);
}); // => bob's name has 3 letters in it.
    //    joe's name has 3 letters in it.
    //    steve's name has 5 letters in it.
    //    TypeError: Cannot read property 'length' of undefined
    //        at names.forEach (repl:2:42)
    //        at Array.forEach (<anonymous>)
```

Let's add some exception handling to this program:
```js
let names = ['bob', 'joe', 'steve', undefined, 'frank'];

names.forEach(name => {
  try {
    console.log(`${name}'s name has ${name.length} letters in it.`);
  } catch (exception) {
    console.log('Something went wrong');
  }
}); // => bob's name has 3 letters in it.
    //    joe's name has 3 letters in it.
    //    steve's name has 5 letters in it.
    //    Something went wrong
    //    frank's name has 5 letters in it.
```

We can also raise our own exceptions:
```js
function foo(number) {
  if (typeof number !== "number") {
    throw new TypeError("expected a number");
  }

  // we're guaranteed to have a number here
}
```

## Syntax Error
A special kind of exception occurs if the code can't be handled as valid JavaScript. Such errors cause JavaScript to raise a `SyntaxError`. A `SyntaxError` is special in that it occurs immediately after loading a JavaScript program, but before it begins to run. Unlike a `TypeError` exception that is dependent upon runtime conditions, JavaScript detects syntax errors based solely on the text of your program. Since they are detected before execution begins, you can't use a `try/catch` statement to catch one.

Here's some code that will cause a syntax error:
```js
console.log("hello");

function foobar()
  // some code here
}

foobar();
```
output:
```js
}
^

SyntaxError: Unexpected token '}'
```

There are some situations where JavaScript can throw a SyntaxError after a program begins running. For instance, this code raises a SyntaxError at runtime:
```js
JSON.parse('not really JSON');  // SyntaxError: Unexpected token i in JSON at position 0
```

# Stack Traces
```js
TypeError: Cannot read property 'length' of undefined
    at names.forEach (repl:2:42)
    at Array.forEach (<anonymous>)
```
This error message is a stack trace: it reports the type of error that occurred, where it occurred, and how it got there.

