# Mutating Objects
What will the code below output to the console?
```js
let message = 'Hello from the global scope!';

function func(message) {
  message = 'Hello from the function scope!';
  console.log(message);
}

func(message);
console.log(message);
```

Solution:
```js
'Hello from the function scope!'
'Hello from the global scope!'
```

2. What will the code below log to the console? What does this output demonstrate in relation to the output of problem one?
```js
let myObj = { message: 'Greetings from the global scope!' };

function func(obj) {
  obj.message = 'Greetings from the function scope!';
  console.log(obj.message);
}

func(myObj);

console.log(myObj.message);
```

Solution:
```js
'Greetings from the function scope!'
'Greetings from the function scope!'
```

3. What will the code below log to the console?
```js
let message = 'Hello from the global scope!';

function func() {
  message = 'Hello from the function scope!';
  console.log(message);
}

func();
console.log(message);
```

Solution:
```js
'Hello from the function scope!'
'Hello from the function scope!'
```

4. What will the code below log to the console?
```js
let a = 10;
let obj = {
  a
}

let newObj = obj;
newObj.a += 10;

console.log(obj.a === a);
console.log(newObj.a === obj.a);
```

Solution:
```js
false
true
```

5. Consider the code below:
```js
let animal = {
  name: 'Pumbaa',
  species: 'Phacochoerus africanus',
};

let menagerie = {
  warthog: animal,
};

animal = {
  name: 'Timon',
  species: 'Suricata suricatta',
};

menagerie.meerkat = animal;

menagerie.warthog === animal; // false
menagerie.meerkat === animal; // true
```
If objects are mutable, why does the second to last line return false?

Solution:
They don't point to the same place in memory, `warthog` points to `{name: 'Pumbaa', species: 'Phacochoerus africanus'}` while `animal` points to `{name: 'Timon', species: 'Suricata suricatta'}`

We reassigned `animals` to a new value, we didn't mutate it's value.