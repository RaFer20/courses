# Summary


- `blocks` are just one way Ruby implements closures. `Procs` and `lambdas` are others.

- closures drag their surrounding context/environment around, and this is at the core of how variable scope works.

- `blocks` are great for pushing some decisions to method invocation time.

- `blocks` are great for wrapping logic, where you need to perform some before/after actions.

- we can write our own methods that take a block with the `yield` keyword.

- when we `yield`, we can also pass arguments to the block.

- when we `yield`, we have to be aware of the block's return value.

- once we understand `blocks`, we can re-implement many of the common methods in the Ruby core library in our own classes.

- the `Symbol#to_proc` is a nice shortcut when working with collections.

- how to return a chunk of code from a method or block
