# Syntactic Sugar

## Concise Property Initializers
We can use the following syntax to initialize object properties:
```js
let obj = {
  foo: "foo",
  bar: "bar",
  qux: 42,
};
```
This syntax is easy to understand, but sometimes we need to initialize an object from a bunch of variables, often using the same name:
```js
function xyzzy(foo, bar, qux) {
  return {
    foo: foo,
    bar: bar,
    qux: qux,
  };
}
```

ES6 introduced a new concise syntax that simplifies initializations of this nature:
```js
function xyzzy(foo, bar, qux) {
  return {
    foo,
    bar,
    qux,
  };
}
```
In each case, we merely use the name of the property we want to initialize, and JavaScript looks for a variable with the same name to use as the initial value.

You can mix this concise notation with ordinary initializers:
```js
function xyzzy(foo, bar, qux) {
  return {
    foo,
    bar,
    answer: qux,
  };
}
```
In this case, we create a property named answer for the qux variable.

## Concise Methods
We can also define methods with a concise notation. In classic JavaScript, we would write:
```js
let obj = {
  foo: function() {
    // do something
  },

  bar: function(arg1, arg2) {
    // do something else with arg1 and arg2
  },
}
```

The new concise method shorthand lets us eliminate the `:` and the word `function`:
```js
let obj = {
  foo() {
    // do something
  },

  bar(arg1, arg2) {
    // do something else with arg1 and arg2
  },
}
```
We can mix and match the different styles in a single object. However, we should use a consistent style within each object definition.

## Object Destructuring
One of the most useful new features in ES6 is destructuring, a shorthand syntax that lets you perform multiple assignments in a single expression. For instance, consider this code:
```js
let obj = {
  foo: "foo",
  bar: "bar",
  qux: 42,
};

let foo = obj.foo;
let bar = obj.bar;
let qux = obj.qux;
```

This code is straightforward and easy to understand, but it's already starting to get tedious with just 3 assignments. Destructuring of objects lets us deal with this more easily:
```js
let { foo, bar, qux } = obj;
```
This shorthand is equivalent to the last 3 lines of the example. The spaces inside the braces aren't required. However, it's easier to read if you use the spaces.

The order of the names between the braces isn't important:
```js
let { qux, foo, bar } = obj;
```
The result from this code is identical: `qux` is assigned `obj.qux`, foo is assigned obj.foo, and bar is assigned obj.bar.

You can omit any names that you don't need:
```js
let { foo } = obj;
let { bar, qux } = obj;
```

We can even use different names for the result:
```js
let { qux: myQux, foo, bar } = obj;
```
This example creates a myQux variable that receives the value of obj.qux.


Other examples include:
function parameters:
```js
function xyzzy({ foo, bar, qux }) {
  console.log(qux); // 3
  console.log(bar); // 2
  console.log(foo); // 1
}

let obj = {
  foo: 1,
  bar: 2,
  qux: 3,
};

xyzzy(obj);
```
The function's definition uses destructuring to pull out the needed properties and store them in local variables.


The function's definition uses destructuring to pull out the needed properties and store them in local variables.
```js
{ foo, bar, qux } = obj;
```
This code produces a syntax error since, in this context, `{` marks the beginning of a block rather than destructuring. The fix is easy, but not obvious -- add parentheses:
```js
({ foo, bar, qux } = obj);
```

## Array Destructuring
```js
let foo = [1, 2, 3];
let [ first, second, third ] = foo;
```
Is equivalent to the following:
```js
let foo = [1, 2, 3];
let first = foo[0];
let second = foo[1];
let third = foo[2];
```

We can skip elements we don't need:
```js
let bar = [1, 2, 3, 4, 5, 6, 7];
let [ first, , , fourth, fifth, , seventh ] = bar;
```


We can perform multiple assignments in a single expression:
```js
let one = 1;
let two = 2;
let three = 3;

let [ num1, num2, num3 ] =  [one, two, three];

console.log(num1);   // 1
console.log(num2);   // 2
console.log(num3);   // 3
```

Which is handy when we need to swap the values in two variables:
```js
let one = 1;
let two = 2;

[ one, two ] =  [two, one];

console.log(one);   // 2
console.log(two);   // 1
```

We can use rest syntax in array destructuring to assign a variable to the rest of an array:
```js
let foo = [1, 2, 3, 4];
let [ bar, ...qux ] = foo;
console.log(bar);   // 1
console.log(qux);   // [2, 3, 4]
```


## Spread Syntax
The spread syntax uses `...` to "spread" the elements of an array or object into separate items. Consider this code:
```js
function add3(item1, item2, item3) {
  return item1 + item2 + item3;
}

let foo = [3, 7, 11];
add3(foo[0], foo[1], foo[2]); // => 21
```
That's somewhat tedious and error-prone, especially if you need to pass a large number of arguments to a function, but they're all stored in an array. You can, of course, use Function.prototype.apply:
```js
add3.apply(null, foo); // => 21
```
That works great, but it's even easier to use the spread syntax:
```js
add3(...foo); // => 21
```
In many cases, spread syntax can entirely replace the apply method.

### Common Use-Cases for the Spread Syntax
```js
// Create a clone of an array
let foo = [1, 2, 3];
let bar = [...foo];
console.log(bar);         // [1, 2, 3]
console.log(foo === bar); // false -- bar is a new array
```
```js
// Concatenate arrays
let foo = [1, 2, 3];
let bar = [4, 5, 6];
let qux = [...foo, ...bar];
qux;  // => [1, 2, 3, 4, 5, 6]
```
```js
// Insert an array into another array
let foo = [1, 2, 3]
let bar = [...foo, 4, 5, 6, ...foo];
bar; // => [1, 2, 3, 4, 5, 6, 1, 2, 3]
```
```js
// Create a clone of an object
let foo = { qux: 1, baz: 2 };
let bar = { ...foo };
console.log(bar);         // { qux: 1, baz: 2 }
console.log(foo === bar); // false -- bar is a new object
```
```js
// Merge objects
let foo = { qux: 1, baz: 2 };
let xyz = { baz: 3, sup: 4 };
let obj = { ...foo, ...xyz };
obj;  // => { qux: 1, baz: 3, sup: 4 }
```

**Note that spread syntax with objects only returns the properties that Object.keys would return. That is, it only returns enumerable "own" properties. That means, in part, that it's not the right choice when you need to duplicate objects that inherit from some other object. It also means that you lose the object prototype.The object prototype is not enumerable. Also, the length property of an array is not enumerable.**

## Rest Syntax
In some ways, you can think of rest syntax as the opposite of spread syntax. Instead of spreading an array or object out into separate items, it instead collects multiple items into an array or object. 
```js
let foo = [1, 2, 3, 4];
let [ bar, ...otherStuff ] = foo;
console.log(bar);        // 1
console.log(otherStuff); // [2, 3, 4]
```
Here, `...otherStuff` uses rest syntax to collect the remaining elements of `foo` into a new array called `otherStuff`.

We can also use the rest syntax with objects:
```js
let foo = {bar: 1, qux: 2, baz: 3, xyz: 4};
let { bar, baz, ...otherStuff } = foo;
console.log(bar);        // 1
console.log(baz);        // 3
console.log(otherStuff); // {qux: 2, xyz: 4}
```

**Note that the rest element (otherStuff in both examples) must be the last item in any expression that uses rest syntax.**



In classical JavaScript, a function that determines the maximum value in a list of numbers may use the built-in variable arguments like this:
```js
function maxItem() {
  let maximum = arguments[0];
  [].forEach.call(arguments, value => {
    if (value > maximum) {
      maximum = value;
    }
  });

  return maximum;
}

console.log(maxItem(2, 6, 10, 4, -3));
```
With rest syntax, we can write this code more clearly:
```js
function maxItem(first, ...moreArgs) {
  let maximum = first;
  moreArgs.forEach(value => {
    if (value > maximum) {
      maximum = value;
    }
  });

  return maximum;
}

console.log(maxItem(2, 6, 10, 4, -3));
```