# Garbage Collection
In JavaScript, values are allocated memory when they are created, and they are eventually, "automatically" freed up when they are not in use. This process of "automatically" freeing memory up is called garbage-collection. 

Programming languages that don't have garbage collection, GC for short, make the developer write code to deallocate (unclaim or release) memory when the program no longer needs the data. This process is messy and error-prone, and often leads to serious bugs and "memory leaks."

Suppose we have a fictional version of JavaScript that doesn't allocate memory and do GC. Programs written in this fictional JavaScript make the developer manage memory allocation and deallocation for every object or primitive value. The code might look something like this:
```js
let name = claim(5);   // Claim 5 bytes of memory for use by name
if (memoryNotAllocated(name)) {
  throw new Error("Memory allocation error!");
}

copy(name, "Sarah");  // Copies "Sarah" into claimed memory referenced by name
console.log(name);    // Do something with object referenced by name
release(name);        // Release memory for use by others
```

Of course, JavaScript allocates memory for us and has GC, so this intricate dance of claim/test/copy/use/release isn't necessary. We can write the above code in a simpler, familiar way:
```js
let name = 'Sarah';   // Declare a variable and set its value. The JavaScript
                      // runtime automatically allocates the memory.
console.log(name);    // Do something with name
```

To illustrate how references work with GC:
```js
function logName() {
  let name = 'Sarah'; // Declare a variable and set its value. The JavaScript
                      // runtime automatically allocates the memory.
  console.log(name);  // Do something with name
}

logName();
// "Sarah" is now eligible for GC
// more code below this line
```

What happens, though, if logName returns the value of name and we save it?
```js
function logName() {
  let name = 'Sarah'; // Declare a variable and set its value. The JavaScript
                      // runtime automatically allocates the memory.
  console.log(name);  // Do something with name
  return name;        // Returns "Sarah" to caller
}

let loggedName = logName(); // loggedName variable is assigned the value "Sarah"
                            // the "Sarah" assigned to `loggedName` is NOT eligible for GC
                            // the "Sarah" assigned to `name` IS eligible for GC
// more code below this line
```
Take note that there were two "Sarah" values in memory since it is a primitive value and it is only one of the two that becomes eligible. 


What happens if we store the value "Sarah" as a property of an object?
```js
function logName() {
  let name = {
    firstName: 'Sarah'          // Declare a variable and set its value. The JavaScript
  };                            // runtime automatically allocates the memory.

  console.log(name.firstName);  // Do something with name
  return name;                  // Returns the `name` object to caller
}

let loggedName = logName();     // loggedName variable is assigned the value stored in name
                                // which is a reference to the object literal { firstName: "Sarah" }
                                // The value returned is NOT eligible for GC.
                                // This value is the same value that is assigned to name
// more code below this line
```

## Why Do We Need To Know About Garbage Collection?
Consider a reference counting garbage collector with this code:
```js
function go() {
  let foo = {};
  let bar = { qux: foo };
  foo.xyz = bar;
}

go();
// Neither `foo` nor `bar` is eligible for GC
```
Both objects have reference counts of 2: one reference is to the variable to which each object is assigned, and the other reference is in a property of the other object.

When we exit the go function, the reference counts of both objects get decremented by 1 since both foo and bar have gone out of scope, so they no longer hold references to the objects. However, the two objects still exist and are not eligible for garbage collection since they still reference each other. These two objects will never go away until the program ends.

If we add a loop to illustrate this:
```js
function go() {
  let foo = {};
  let bar = { qux: foo };
  foo.xyz = bar;
}

for (let count = 0; count < 1000000; count += 1) {
  go();
}
// There are now 2000000 objects still on the heap but ineligible for GC
```
When this code runs, none of those objects ever get garbage collected. As can be seen in the comments, we now have 2000000 unused objects that aren't going to go away.

Modern JavaScript engines use what is called a **mark and sweep algorithm** to do GC. That eliminates the reference cycle problem described above, but also introduces other problems, including the potential for fragmented memory. Fragmented memory means that your program's memory isn't contiguous, but is broken up into discontiguous chunks. If there are enough such chunks, your system will have a harder time allocating large chunks of memory.

## How Closures Affect Garbage Collection
When you create a closure, it stores a reference to all variables it can access. Each of those variables references an object or primitive value. Theoretically, as long as the closure exists, those variables remain in existence, which means that the objects or values they reference must also endure. For this reason, JavaScript can't garbage collect any objects referenced by the variables that the closure keeps in its context.

```js
function makeArrayLogger(arr) {
  return function() {
    console.log(arr);
  };
}

let logger = makeArrayLogger([1, 2, 3]);
```
After the above code runs, `logger` references a function that closed over the local variable arr, which right now contains the array `[1, 2, 3]`. Since the closure must keep arr around, the reference to `[1, 2, 3]` must also stick around, which means that JavaScript can't garbage collect `[1, 2, 3]`. 

Before JavaScript can garbage collect [1, 2, 3], you must ensure that nothing else in the program references it; that includes every closure that has access to the [1, 2, 3] array. That's not typically a concern, but if you find that you must remove a closure or other reference explicitly, you can assign null to the item that references it. For instance:
```js
logger = null;
```