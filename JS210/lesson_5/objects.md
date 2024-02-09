# Objects
## Creating Custom Objects
You can create your own objects using the object literal notation:
```js
let colors = {
  red: '#f00',
  orange: '#ff0',
};

typeof colors;      // "object"
colors.red;         // "#f00"
colors.orange;      // "#ff0"
```
There are two more ways to create objects: with an object constructor function, like new String('foo'), or with the Object.create method. 

## Properties
Objects are containers for two things: data and behavior. The data consists of named items with values; the values represent the attributes of the object. In JavaScript, we call these associations between a name (or key) and a value, properties.

To get the value of an object property, you can append a single dot followed by the property name, to the object's name:
```js
let animal = 'turtle';
animal.length;          // 6

let colors = {
  red: '#f00',
  orange: '#ff0',
};

colors.red;             // "#f00"

'blue'.length;          // 4 - works with primitives too
```
You can set a new value for a property with assignment:
```js
let count = [0, 1, 2, 3, 4];
count.length = 2;

let colors = {
  red: '#f00',
  orange: '#ff0',
};

colors.blue = '#00f';
```

### Property Names and Values
A property name for an object can be any valid string, and a property value can be any valid expression:
```js
let object = {
  a: 1,                           // a is a string with quotes omitted
  'foo': 2 + 1,                   // property name with quotes
  'two words': 'this works too',  // a two word string
  true: true,                     // property name is implicitly converted to string "true"
  b: {                            // object as property value
    name: 'Jane',
    gender: 'female',
  },
  c: function () {                // function expression as property value
    return 2;
  },
  d() {                           // compact method syntax
    return 4;
  }
};
```

### Accessing Property Values
We can access property values using "dot notation" or "bracket notation":

```js
let object = {
  a: 'hello',
  b: 'world',
};

object.a;                 // "hello", dot notation
object['b'];              // "world", bracket notation
object.c;                 // undefined when property is not defined

let foo = {
  a: 1,
  good: true,
  'a name': 'hello',
  person: {
    name: 'Jane',
    gender: 'female',
  },
  c: function () {        // function expression as property value
    return 2;
  },
  d() {                   // compact method syntax
    return 4;
  }
};

foo['a name'];            // "hello", use bracket notation when property name is an invalid identifier
foo['goo' + 'd'];         // true, bracket notation can take expressions
let a = 'a';
foo[a];                   // 1, bracket notation works with variables since they are expressions
foo.person.name;          // "Jane", dot notation can be chained to "dig into" nested objects
foo.c();                  // 2, Call the method 'c'
foo.d();                  // 4, Call the method 'd'
```

### Adding and Updating Properties
To add a new property to an object, use "dot notation" or "bracket notation" and assign a value to the result:
```js
let object = {};              // empty object

object.a = 'foo';
object.a;                     // "foo"

object['a name'] = 'hello';
object['a name'];             // "hello"

object;                       // { a: "foo", "a name": "hello" }
```
If the property already exists, its value is updated:
```js
let object = {};

object.a = 'foo';
object.a;                    // "foo"

object.a = 'hello';
object.a;                    // "hello"

object['a'] = 'world';
object.a;                    // "world"
```
We can use the reserved keyword delete to delete properties from objects:
```js
let foo = {
  a: 'hello',
  b: 'world',
};

delete foo.a;
foo;                      // { b: "world" }
```

### Stepping through Object Properties
Objects are a collection type. This means a single Object can store multiple values. A common task is to perform some action for each element in a collection. You can do this with a for…in loop:
```js
let nicknames = {
  joseph: 'Joey',
  margaret: 'Maggie',
};

for (let nick in nicknames) {
  console.log(nick);
  console.log(nicknames[nick]);
}

// logs on the console:
joseph
Joey
margaret
Maggie
```
We can also retrieve the names of all properties in an object with Object.keys:
```js
let nicknames = {
  joseph: 'Joey',
  margaret: 'Maggie',
};

Object.keys(nicknames);  // [ 'joseph', 'margaret' ]
```


## Methods
When functions are part of an objects we call them methods. To call a method on an object, you access the method as though it is a property (it is!), and call it by appending parentheses. You can pass arguments to the method by listing them between the parentheses, just like with a function call.

Examples:
```js
(5.234).toString();       // "5.234"
'pizza'.match(/z/);       // [ "z", index: 2, input: "pizza" ]
Math.ceil(8.675309);      // 9
Date.now();               // 1467918983610
```

*As a matter of style, custom objects that use object literal notation always use a trailing comma when written across multiple lines. This means that the last property or method of an object ends with a comma (,).*
property as last:
```js
let myObj = {
  prop1: 'sample data',
  method1: function () {},
  prop2: 'sample data',
};
```
method as last:
```js
let myObj = {
  prop1: 'sample data',
  prop2: 'sample data',
  method1: function () {},
};
```
Two major benefits to using trailing commas:
- If you reorganize or re-position the contents of the object literal, you just have to move the last entry to its new position. You don't have to worry about adding a comma to the property, or removing it from another property.
- Without a trailing comma, adding a property shows up as 2 lines of changes when you run `git diff`. One line differs only in the presence of a new comma, while the second line is the new item. If you use a trailing comma everywhere, only the new line shows in the `git diff` output.

```js
// no trailing comma
let myObj = {
  prop1: 'sample data',
  prop2: 'sample data',
  method1: function () {}
};

// adding a property
let myObj = {
  prop1: 'sample data',
  prop2: 'sample data',
  method1: function () {},  // changed
  prop3: 'sample data'      // added
};
```

For simple one-line literals, you don't need the trailing comma:
```js
let coordinates = { x: 25, y: 50 };
```


## Compact Method Notation
ES6 introduced a new way of writing methods called the compact method syntax. Rather than writing the property name, a colon, and then a function expression, you can use a much simplified syntax.

We can write:
```js
let myObj = {
  foo(who) {
    console.log(`hello ${who}`);
  },

  bar(x, y) {
    return x + y;
  },
};
```

### Arrow Functions and Methods
It's possible to define methods as arrow functions. However, that is not a good idea. Arrow functions have a subtle behavior that, in most cases, makes them unsuitable for use as methods.

*Note that it is safe to use arrow functions in the body of a method; just don't use them to define the actual method.*
