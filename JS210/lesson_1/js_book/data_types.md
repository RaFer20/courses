# Strings
You write string literals with either single quotes ('hi there') or double quotes ("hi there") on either side of the text; note that the quotes are syntactic components, not part of the value.

```js
> "He said, 'Hi there!'"    // with double quotes
= "He said, 'Hi there!'"

> 'He said, \'Hi there!\''  // with single quotes and escaping
= "He said, 'Hi there!'"

> 'He said, "Hi there!"'    // with single quotes
= 'He said, "Hi there!"'

> "He said, \"Hi there!\""  // with double quotes and escaping
= 'He said, "Hi there!"'
```

Backticks enable string interpolation:
```js
> `5 plus 5 equals ${5 + 5}`
= '5 plus 5 equals 10'

`Blah ${expression} blah.`
```

# Numbers
Some programming languages have different data types for different number types, such as integers, floating-point numbers, and fixed-point (decimal) numbers. *JavaScript has a single data type, Number, that represents all types of numbers.*

```js
1, 2, -3, 4.5, -6.77, 234891234 // Examples of numeric literals
```

# Booleans
Boolean values represent an "on" or "off" state. 

There are two boolean literal values: true and false:
```js
> let toggleOn = true
= undefined

> let sessionActive = false
= undefined

> 5 === 5
= true

> 100 < 99
= false
```

# Undefined
When a variable is not defined, its value is given by undefined. We can describe undefined as representing the absence of a value. We can also explicitly use the literal `undefined`.
```js
setAgeFor('Pete', undefined);
```

The `console.log` function is an example of a function that returns `undefined`:
```js
> console.log("Hello, World!")
Hello, World!
= undefined
```

`undefined` also arises when declaring variables without an explicit value. 
```js
> let foo
= undefined

> foo
= undefined

> let bar = 3
= undefined

> bar
= 3
```

# Null
`null` is similar to `undefined`: it represents the intentional absence of a value. Often, `null` represents emptiness or nothing. The chief difference between `null` and `undefined` is that you must use `null` explicitly if you want to use it; `undefined` can arise implicitly.

```js
> let foo = null
```
In the code above, null is specified as a literal value.

# The `typeof` Operator
We can use `typeof` to see what type a particular value has. `typeof` returns a string with the type of it's operand's value.

```js
> typeof 1
= 'number'

> typeof 'foo'
= 'string'

> typeof true
= 'boolean'

> typeof undefined
= 'undefined'

> typeof null
= 'object'

> typeof [1, 2, 3]
= 'object'
```