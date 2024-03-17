# Objects and Closures
```js
function makeList() {
  let items = [];

  return function(newItem) {
    let index;
    if (newItem) {
      index = items.indexOf(newItem);
      if (index === -1) {
        items.push(newItem);
        console.log(newItem + ' added!');
      } else {
        items.splice(index, 1);
        console.log(newItem + ' removed!');
      }
    } else {
      if (items.length === 0) {
        console.log('The list is empty.');
      } else {
        items.forEach(function(item) {
          console.log(item);
        });
      }
    }
  };
}
```
The function returned by `makeList` lets the user perform three different actions (adding, removing, and listing) by calling the function with appropriate arguments. This code works, but it's unclear. 

We can improve the interface by returning an Object from makeList instead of a single Function. If we do that, we can create an interface that is easy to use and understand:
```js
function makeList() {
  let items = [];

  return {
    add(item) {
      let index = items.indexOf(item);
      if (index === -1) {
        items.push(item);
        console.log(item + ' added!');
      }
    },

    list() {
      if (items.length === 0) {
        console.log('The list is empty.');
      } else {
        items.forEach(function(item) {
          console.log(item);
        });
      }
    },

    remove(item) {
      let index = items.indexOf(item);
      if (index !== -1) {
        items.splice(index, 1);
        console.log(item + ' removed!');
      }
    },
  };
}
```

## Why use closures to make data private?
Using closures to restrict data access is a good way to force other developers to use the intended interface. 

These benefits have a cost. For instance, making data private can make it harder to extend the code. Suppose we need to add a clear method to delete all items from the list. If items is a property, we can do this:
```js
let list = makeList();
list.clear = function() {
  this.items = [];
  console.log('all items deleted!');
};
```

With the way we wrote our code, though, we can't readily add a method:
```js
let list = makeList();
list.clear = function() {
  // there is no way to access the items from within this method
  // because the closure that contains them is inaccessible

  items;                  // throws ReferenceError!
  this.items;             // undefined
};
```

If we want to add the new method we have to update the original definition of `makeList`:
```js
function makeList() {
  let items = [];

  return {
    add(item) {
      let index = items.indexOf(item);
      if (index === -1) {
        items.push(item);
        console.log(item + ' added!');
      }
    },

    clear() {
      items = [];
      console.log('all items deleted!');
    },

    list() {
      items.forEach(function(item) {
        console.log(item);
      });
    },

    remove(item) {
      let index = items.indexOf(item);
      if (index !== -1) {
        items.splice(index, 1);
        console.log(item + ' removed!');
      }
    }
  };
}
```