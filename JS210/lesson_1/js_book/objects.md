# Objects
Objects store a collection of key-value pairs: each item in the collection has a name that we call the key and an associated value. Contrast this with arrays, which associate values with ordered indexes.

*An object's keys are strings or symbols, but the values can be any type, including other objects.*

We can create an object using object literal syntax:
```js
let person = {
  name:    'Jane',
  age:     37,
  hobbies: ['photography', 'genealogy'],
};
```
They can also be written in a single line:
```js
> let person = { name: 'Jane', age: 37, hobbies: ['photography', 'genealogy'] }
```

Though the keys are strings, we typically omit the quotes when the key consists entirely of alphanumeric characters and underscores. The values of each pair can be any type.

We can access a specific value in an object in two ways: 1) dot notation and 2) bracket notation.
```js
> person.name                 // dot notation
= 'Jane'

> person['age']               // bracket notation
= 37
```

Let's add some more key-value pairs to the person object:
```js
> person.height = '5 ft'
= '5 ft'

> person['gender'] = 'female'
= 'female'

> person
= { name: 'Jane', age: 37, hobbies: ['photography', 'genealogy'], height: '5 ft', gender: 'female' }
```

If you want to remove something from an existing object, you can use the delete keyword:
```js
> delete person.age
= true

> delete person['gender']
= true

> delete person['hobbies']
= true

> person
= { name: 'Jane', height: '5 ft' }
```
`delete` removes the key-value pair from the object and returns true unless it cannot delete the property (for instance, if the property is non-configurable).


If a variable is initialized with `const` we can't change what object the variable refers to. What we can do is modify that object's properties and property value.

Example:
```js
> const MyObj = { foo: "bar", qux: "xyz" }
> MyObj.qux = "hey there"
> MyObj.pi = 3.1415
> MyObj
= { foo: 'bar', qux: 'hey there', pi: 3.1415 }

> MyObj = {} // Uncaught TypeError: Assignment to constant variable.
```

We can use Object.freeze with objects to freeze the property values of an object, just like you can with arrays:
```js
> const MyObj = Object.freeze({ foo: "bar", qux: "xyz" })
> MyObj.qux = "hey there"
> MyObj
= { foo: 'bar', qux: 'xyz' }
```
