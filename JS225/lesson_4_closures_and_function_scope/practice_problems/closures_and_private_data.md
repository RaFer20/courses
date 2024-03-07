# Practice Problems - Closures and Private Data

## 1. Create a makeCounterLogger function that takes a number as an argument and returns a function. When we invoke the returned function with a second number, it should count up or down from the first number to the second number, logging each number to the console:

### Solution:
```js
function makeCounterLogger(start) {
  return function(end) {
    let i;

    if (start < end) {
      for (i = start; i <= end; i++) {
        console.log(i);
      }
    } else {
      for (i = start; i >= end; i--) {
        console.log(i);
      }
    }
  };
}
```

## 2. We'll build a simple todo list program using the techniques we've seen in this assignment. Write a makeList function that returns a new function that implements a todo list. The returned function should have the following behavior:
- When called with an argument that is not already on the list, it adds that argument to the list.
- When called with an argument that is already on the list, it removes the element from the list.
- When called without arguments, it logs all items on the list. If the list is empty, it logs an appropriate message.

### Solution:
```js
function makeList() {
  let toDoList = [];
  return function(toDo) {
    if (!toDo) {
      toDoList.length > 0 ? toDoList.forEach((task) => console.log(task)) : console.log('The list is empty.');
    } else {
      if (!toDoList.includes(toDo)) {
        toDoList.push(toDo)
        console.log(toDo + ' added!')
      } else {
        toDoList.splice(toDoList.indexOf(toDo), 1)
        console.log(toDo + ' removed!')
      }
    }
  }
}
```

Alternative:
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