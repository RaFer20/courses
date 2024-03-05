# Practice Problems - Dealing with Context Loss

1. Our desired output for the code below is: `Christopher Turk is a Surgeon`. What will the code output, and what explains the difference, if any, between the actual and desired outputs?
```js
let turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }
};

function logReturnVal(func) {
  let returnVal = func();
  console.log(returnVal);
}

logReturnVal(turk.getDescription);
```

Solution:
`undefined undefined is a undefined.` is output to the console. When we pass `getDescription` to `logReturnVal` we are removing the method from it's context. Because of this, in `func`, `this` points to the global object and not `turk`, the global object doesn't have `firstName`, `lastName` and `occupation` properties so we get `undefined` in the output instead.


2. Alter `logReturnVal` such that it takes an additional `context` argument, and use one of the methods we've learned in this lesson to invoke `func` inside of `logReturnVal` with `context` as its function execution context. Alter the invocation of `logReturnVal` and supply `turk` as the context argument.

Solution:
```js
function logReturnVal(func, context) {
  let returnVal = func.call(context);
  console.log(returnVal);
}

logReturnVal(turk.getDescription, turk);
```
We can also use `apply` instead of `call` in the same way in this solution.

3. Suppose that we want to extract `getDescription` from `turk`, but always have it execute with `turk` as context. Use one of the methods we've learned in the last lesson to assign such a permanently bound function to a new variable, `getTurkDescription`.

Solution:
```js
let getTurkDescription = turk.getDescription.bind(turk);
```

4. Consider the code below, and our desired output:
```js
let TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();
```
Desired output:
```js
The Elder Scrolls Arena
The Elder Scrolls Daggerfall
The Elder Scrolls Morrowind
The Elder Scrolls Oblivion
The Elder Scrolls Skyrim
```
Will this code log our desired output? Why or why not?

Solution:
No, when we use functions as arguments they lose their surrounding context. The function expression being invoked on each iteration of `forEach` has the global object as it's context so `this` resolves to `undefined` every time.

5. Use an arrow function so that the code logs our desired output.

Solution:
```js
let TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames() {
    this.titles.forEach((title) => {
      console.log(this.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();
```

6. Use the `let self = this` fix to alter `TESgames.listGames` such that it logs our desired output to the console.

Solution
```js
let TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames() {
    let self = this;

    this.titles.forEach(function(title) {
      console.log(self.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();
```

7. If we don't want to rely on `let self = this`, `forEach` provides us with an alternative means of supplying execution context to the inner function. Use this means to achieve our desired output.

Solution:
```js
let TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    }, this);
  }
};

TESgames.listGames();
```

8. Consider the code below:
```js
let foo = {
  a: 0,
  incrementA() {
    function increment() {
      this.a += 1;
    }

    increment();
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();
```
What will the value of foo.a be after this code has executed?

Solution:
`0`, inner functions lose the outer object as context so `this` references the global object.

9. Use one of the methods we learned in this lesson to invoke `increment` with explicit context such that `foo.a` is incremented with each invocation of `incrementA`.

Solution:
```js
let foo = {
  a: 0,
  incrementA() {
    function increment() {
      this.a += 1;
    }

    increment.call(this);
  }
};
```

10. We decide that we want each invocation of `foo.incrementA` to increment `foo.a` by `3`, rather than `1`, and alter our code accordingly:
```js
let foo = {
  a: 0,
  incrementA() {
    function increment() {
      this.a += 1;
    }

    increment.apply(this);
    increment.apply(this);
    increment.apply(this);
  }
};
```
Calling `apply` three times seems repetitive, though. Use `bind` to permanently set `foo` as `increment`'s execution context.

Solution:
```js
let foo = {
  a: 0,
  incrementA() {
    let increment = function() {
      this.a += 1;
    }.bind(this)

    increment();
    increment();
    increment();
  }
};
```