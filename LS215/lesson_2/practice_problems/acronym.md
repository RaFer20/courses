# Acronym
Write a function that generates and returns an acronym from a string of words. For example, the function should return "PNG" for the string "Portable Network Graphics". Count compound words (words connected with a dash) as separate words.

Examples
```js
function acronym(string) {
  // ...
}

acronym('Portable Network Graphics');                  // "PNG"
acronym('First In, First Out');                        // "FIFO"
acronym('PHP: HyperText Preprocessor');                // "PHP"
acronym('Complementary metal-oxide semiconductor');    // "CMOS"
acronym('Hyper-text Markup Language');                 // "HTML"
```

## Solution
```js
function acronym(string) {
  return string.split(/\W+/)
               .map((w) => w[0].toUpperCase())
               .join('');
}
```
`/\W+/` matches `\W` non-word characters and we have a `+` quantifier so it will match multiple non-word characters in a row.


Alternative:
```js
function acronym(string) {
  return string.replace(/-/g, ' ')
               .split(' ')
               .map(word => word[0].toUpperCase())
               .join('');
}
```
`/-/g` replaces hyphens globally in the string (not just the first occurrence) with spaces.