# Practice Problems - Objects and Closures

## 1. Reimplement `makeList`, so that it returns an Object that provides the interface shown below, including add, list, and remove methods.
```js
> let list = makeList();
> list.add('peas');
= peas added!
> list.list();
= peas
> list.add('corn');
= corn added!
> list.list();
= peas
= corn
> list.remove('peas');
= peas removed!
> list.list();
= corn
```

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

### Solution:
```js
function makeList() {
  return {
    items: [],
    list() {
      if (this.items.length === 0) {
        console.log('The list is empty.');
      } else {
        this.items.forEach(item => {
          console.log(item);
        })
      }
    },
    add(item) {
      this.items.push(item);
      console.log(item + ' added!');
    },
    remove(item) {
      this.items.splice(this.items.indexOf(item), 1);
      console.log(item + ' removed!');
    }
  }
}
```

Alternative:
```js
function makeList() {
  return {
    items: [],
    list() {
      if (this.items.length === 0) {
        console.log('The list is empty.');
      } else {
        this.items.forEach(item => {
          console.log(item);
        })
      }
    },
    add(item) {
      this.items.push(item);
      console.log(item + ' added!');
    },
    remove(item) {
      this.items.splice(this.items.indexOf(item), 1);
      console.log(item + ' removed!');
    }
  }
}
```

## 2. Notice that the solution lets us access the array of items through the `items` property:
```js
> list.items;            // items accessible from outside object
= ['corn']               // since it is an object property
```

This was not the case in the single-function implementation:
```js
> list.items;            // items not accessible from outside function
= undefined              // since it is within a closure
```
Update the implementation from problem 1 so that it retains the use of an object with methods but prevents outside access to the items the object stores internally.

### Solution:
```js
function makeList() {
  let items = [];
  return {
    list() {
      if (items.length === 0) {
        console.log('The list is empty.');
      } else {
        items.forEach(item => {
          console.log(item);
        })
      }
    },
    add(item) {
      items.push(item);
      console.log(item + ' added!');
    },
    remove(item) {
      items.splice(items.indexOf(item), 1);
      console.log(item + ' removed!');
    }
  }
}
```
