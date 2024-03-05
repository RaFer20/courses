JavaScript objects may contain methods among their properties. You can think of methods as Functions with a receiver, which is the object the method is called on. If a call doesn't have an explicit receiver, it is a function. 

# Function and Method Invocation
```js
let greeter = {
  morning: function() {
    console.log('Good morning!');
  },
};

function evening() {
  console.log('Good evening!');
}

// Method invocation
greeter.morning();   // greeter is the receiver/calling object; morning() is a method

// Function invocation
evening();           // there is no explicit receiver; evening() is a function
```

The above example demonstrates the difference between method and function invocation. Note, though, that one function object can use both invocations:
```js
let greeter = {
  morning: function() {
    console.log('Good morning!');
  },
};

// Method invocation: executing a method
greeter.morning(); // => Good morning!

// Create a variable which points at the greeter.morning method
let functionGreeter = greeter.morning; // returns [Function: morning]

// Function invocation: executing a function
functionGreeter();  // => Good morning!
```

# `this` During Method Invocation
The value of this is a reference to the object itself.
```js
let counter = {
  count: 0,
  advance: function() {
    this.count += 1;
  },
};

counter;                // { count: 0, advance: [Function] }

counter.advance();
counter;                // { count: 1, advance: [Function] }

counter.advance();
counter.advance();

counter;                // { count: 3, advance: [Function] }
```
Within `advance`, this references the `counter` object. The function can use this to access and change the object's properties. Here, `advance` uses this to increment the `count` property in `counter`.


Object methods are properties that happen to have a Function value. You can define methods when you create the object or later on, object method can also take arguments:
```js
let car = {
  fuel: 7.8,
  running: false,
  start: function() {
    this.running = true;
  },
};

car.stop = function() {
  this.running = false;
};

car.drive = function(distance) {
  this.fuel -= distance / 52;
};
```