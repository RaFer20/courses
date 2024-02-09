# Combining Abstractions

Consider this Array of names:
```js
let names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];
```

If we want to determine which letter is the most frequent starting letter of the names in this list, we can break the problem down into several steps:

1. For each name in the list, determine its first letter.
2. Count the occurrences of each first letter.
3. Find the first letter that occurs most often.

| **Step**                                              | **Result**                                             | **Abstraction** | **Array Method** |
|-------------------------------------------------------|--------------------------------------------------------|-----------------|------------------|
| For each name in the list, determine its first letter | Array of first letters                                 | Transformation  |        map       |
| Count the occurrences of each letter                  | Object containing letters as keys and counts as values | Reduction       |      reduce      |
| Find the letter that occurs most often                | Letter with the largest number of occurrences          | Reduction       |      reduce      |

Step 1:
```js
let names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];
let letters = names.map(name => name[0]);
// letters is [ "H", "G", "K", "H", "K", "K", "O" ]
```

Step 2:
```js
let counts = letters.reduce((obj, letter) => {
  obj[letter] = obj[letter] || 0;  // set obj[letter] to 0 if it doesn't have a value
  obj[letter] += 1;
  return obj;
}, {});

// counts is { H: 2, G: 1, K: 3, O: 1 }
```

Step 3:
```js
let letter = Object.keys(counts).reduce((lastLetter, currentLetter) => {
  if (counts[lastLetter] > counts[currentLetter]) {
    return lastLetter;
  } else {
    return currentLetter;
  }
});

// letter is "K"
```