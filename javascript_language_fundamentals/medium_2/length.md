# Length
Read through the code below. What values will be logged to the console? Can you explain these results?
```js
const languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages);
console.log(languages.length);

languages.length = 4;
console.log(languages);
console.log(languages.length);

languages.length = 1;
console.log(languages);
console.log(languages.length);

languages.length = 3;
console.log(languages);
console.log(languages.length);

languages.length = 1;
languages[2] = 'Python';
console.log(languages);
console.log(languages[1]);
console.log(languages.length);
```

## Solution
```js
['JavaScript', 'Ruby', 'Python']
3

['JavaScript', 'Ruby', 'Python', empty item]
4

['JavaScript']
1

['JavaScript', 2 empty items]
3

['JavaScript', empty item, 'Python']
undefined
3
```
Setting the length to a value that is less than the current length truncates the array; re-setting the length to a higher value does not bring back the truncated elements. 
Setting the length to a value greater than the current length creates 'empty slots' in the array, but the number of actual elements does not increase.