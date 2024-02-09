# Formatting Bands
We have the following Array of information for some popular bands:
```js
let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];
```
There are problems with this data, though, so we first have to clean it up before we can use it:

The band countries are wrong: all the bands should have 'Canada' as the country.
The band name should have all words capitalized.
Remove all dots from the band names.

Write a function that can process the input band Array and return an Array that contains the fixed information:
```js
let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(data) {
  // ...
}

processBands(bands);

// should return:
[
  { name: 'Sunset Rubdown', country: 'Canada', active: false },
  { name: 'Women', country: 'Canada', active: false },
  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
]
```

## Solution
```js
function processBands(data) {
  data.map(band => {
    band.country = 'Canada'
    band.name = processName(band.name)
  });

  return data
}

function processName(name) {
  let words = name.split(' ');
  let newName = words.map(word => {
    if (word.includes('.')) {word = word.split('').filter(letter => letter !== '.').join('')};
    return word[0].toUpperCase() + word.slice(1)
  })

  return newName.join(' ')
}
```

Alternative 1 with side effects:
```js
function processBands(bands) {
  return bands.map(band => {
    updateCountry(band);
    capitalizeBandName(band);
    removeDotsInBandName(band);
    return band;
  });
}

function updateCountry(band) {
  band.country = 'Canada';
}

function capitalizeBandName(band) {
  band.name = band.name
                  .split(' ')
                  .map(word => capitalizeString(word))
                  .join(' ');
}

function capitalizeString(string) {
  let initial = string[0].toUpperCase();
  let rest = string.slice(1, string.length);
  return initial + rest;
}

function removeDotsInBandName(band) {
  band.name = band.name.replace(/\./g, '');
}
```

Alternative 2 reduced side effects:
```js
function processBands(bands) {
  return bands.map(band => {
    let capitalizedName = capitalizePhrase(band.name);
    let newBandName = removeDotsInString(capitalizedName);

    return {
      name: newBandName,
      country: 'Canada',
      active: band.active,
    };
  });
}

function capitalizePhrase(phrase) {
  return phrase.split(' ')
               .map(word => capitalizeString(word))
               .join(' ');
}

function capitalizeString(string) {
  let initial = string[0].toUpperCase();
  let rest = string.slice(1, string.length);
  return initial + rest;
}

function removeDotsInString(string) {
  return string.replace(/\./g, '');
}
```