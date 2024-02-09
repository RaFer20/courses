# Picky Museum Filter
We love to visit museums if they are about science or computers. We're undecided when it comes to modern art, and would rather not go in most cases. However, we're willing to go to any modern art museum that is about Andy Warhol (we like him!) or that is located in nearby Amsterdam. We'd rather skip any other museums.

We tried to implement these preferences in a function, so we can automatically sort through long lists of museums and find the ones that sound interesting. However, our Boolean check is flawed, as it fails some of our test cases. Can you fix it?

```js
function wantToVisit(museum, city) {
  return museum.includes('Computer')
      || museum.includes('Science')
      && !(
        museum.includes('Modern')
        && museum.includes('Art')
        && museum.includes('Andy Warhol')
        || city === 'Amsterdam'
      );
}

// Tests (should all print 'true')

console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
console.log(wantToVisit('Museum of Modern Art', 'New York') === false);
console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false);
console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true);
console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true);
console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);
console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);
```


## Solution
```js
function wantToVisit(museum, city) {
  return (museum.includes('Computer')
      || museum.includes('Science'))
      || (
        museum.includes('Modern')
        && museum.includes('Art')
        && (museum.includes('Andy Warhol')
        || city === 'Amsterdam')
        );
}

// Tests (should all print 'true')

console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
console.log(wantToVisit('Museum of Modern Art', 'New York') === false);
console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false);
console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true);
console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true);
console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);
console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);
```

Refactor:
```js
function wantToVisit(museum, city) {
  function contains(string, substring) {
    return string.toLowerCase().match(substring.toLowerCase()) != null;
  }

  const aboutComputers = contains(museum, 'Computer');
  const aboutScience = contains(museum, 'Science');
  const aboutModernArt = contains(museum, 'Modern') && contains(museum, 'Art');
  const aboutAndyWarhol = contains(museum, 'Andy Warhol');
  const inAmsterdam = (city === 'Amsterdam');

  const mustGo =  aboutComputers || aboutScience;
  const worthAnException = aboutModernArt && (aboutAndyWarhol || inAmsterdam);
  return mustGo || worthAnException;
}
```