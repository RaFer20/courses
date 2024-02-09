# Working with Object Properties

1. Write a function named `objectHasProperty` that takes two arguments: an Object and a String. The function should return true if the Object contains a property with the name given by the String, false otherwise.
```js
let pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

objectHasProperty(pets, 'dog');       // true
objectHasProperty(pets, 'lizard');    // false
objectHasProperty(pets, 'mice');      // true
```

Solution:
```js
function objectHasProperty(obj, str) {
  let keys = Object.keys(obj);
  return keys.includes(str);
}
```

2. Write a function named `incrementProperty` that takes two arguments: an Object and a String. If the Object contains a property with the specified name, the function should increment the value of that property. If the property does not exist, the function should add a new property with a value of `1`. The function should return the new value of the property.
```js
let wins = {
  steve: 3,
  susie: 4,
};

incrementProperty(wins, 'susie');   // 5
wins;                               // { steve: 3, susie: 5 }
incrementProperty(wins, 'lucy');    // 1
wins;                               // { steve: 3, susie: 5, lucy: 1 }
```

Solution:
```js
function incrementProperty(obj, str) {
  if (obj[str]) {
    obj[str] += 1;
  } else {
    obj[str] = 1;
  }
  return obj[str];
}
```

3. Write a function named `copyProperties` that takes two Objects as arguments. The function should copy all properties from the first object to the second. The function should return the number of properties copied.
```js
let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};
copyProperties(hal, sal);  // 2
sal;                       // { model: 9000, enabled: true }
```

Solution:
```js
function copyProperties(firstObject, secondObject) {
  let count = 0;
  for (let property in firstObject) {
    secondObject[property] = firstObject[property];
    count++;
  }
  return count;
}
```

4. Write a function named `wordCount` that takes a single String as an argument. The function should return an Object that contains the counts of each word that appears in the provided String. In the returned Object, you should use the words as keys, and the counts as values.
```js
wordCount('box car cat bag box');  // { box: 2, car: 1, cat: 1, bag: 1 }
```

Solution:
```js
function wordCount(string) {
  let obj = {};
  let array = string.split(' ');
  for (let i = 0; i < array.length; i++) {
    if (obj[array[i]]) {
      obj[array[i]] += 1;
    } else {
      obj[array[i]] = 1;
    }
  }
  return obj;
}
```