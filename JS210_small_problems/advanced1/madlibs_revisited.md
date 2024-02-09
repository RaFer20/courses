Build a madlibs program that takes a text template as input, plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text, and then returns it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program. Your program should read this text and, for each line, place random words of the appropriate types into the text and return the result.

The challenge of this program isn't just about writing your solution—it's about choosing the structure of the text template. Choose the right way to structure your template and this problem becomes much easier. Consequently, this exercise is a bit more open-ended since the input is also something that you'll be defining.

Examples:

Note: The quotes in the example strings returned by the madlibs function are only shown for emphasis. These quotes are not present in the actual output strings. The words in quotes come from the list of texts and it is the madlibs function that puts them in.
```js
function madlibs(template) {
  // ...
}

// These examples use the following list of replacement texts:

------

madlibs(template1);
// The "sleepy" brown "cat" "noisily"
// "licks" the "sleepy" yellow
// "dog", who "lazily" "licks" his
// "tail" and looks around.

madlibs(template1);
// The "hungry" brown "cat" "lazily"
// "licks" the "noisy" yellow
// "dog", who "lazily" "licks" his
// "leg" and looks around.

madlibs(template2);      // The "fox" "bites" the "dog"'s "tail".

madlibs(template2);      // The "cat" "pats" the "cat"'s "head".
```

# Problem
Write a function that takes a template and returns a sentence with sentence elements interpolated into it
Input: template
Output: string

# Examples / Test Cases
```js
const template2 = `The ${noun} ${verb} the ${noun}'s ${noun}`
madlibs(template2);      // The "fox" "bites" the "dog"'s "tail".
madlibs(template2);      // The "cat" "pats" the "cat"'s "head".
```

# Data Structures
Array and Object

# Algorithm
Templates will contain text to be replaced within ${}

initialize an object `replacement` with sentence elements as keys and array of replacement string as values
replace() any word in between ${} in the input template with a corresponding word
return the template

pick(array)
return an element at a random index in the array (Math.floor(Math.random() * array.length))

replaceText(match)
strip the `${}` from a word and uses it to call and return the `pick()` function
- in other words `${noun}` -> `noun` -> `return pick(replacement[noun])`

# Code
```js
const template1 = 'The ${adjective} brown ${noun} ${adverb} ' +
                '${verb} the ${adjective} yellow ' +
                '${noun}, who ${adverb} ${verb} his ' +
                '${noun} and looks around.';

const template2 = "The ${noun} ${verb} the ${noun}'s ${noun}.";

function madlibs(template) {
  const replacement = {
    adjective: ['quick', 'lazy', 'sleepy', 'noisy', 'hungry', 'tired', 'energetic'],
    noun: ['fox', 'dog', 'head', 'leg', 'tail', 'cat', 'ferret', 'lion', 'bear'],
    verb: ['jumps', 'lifts', 'bites', 'licks', 'pats', 'shoves'],
    adverb: ['easily', 'lazily', 'noisily', 'excitedly', 'slowly', 'happily', 'angrily']
  };

  function replaceText(match) {
    const element = match.slice(2, -1);
    return pick(replacement[element])
  }

  template = template.replace(/\${[a-z]+}/gi, replaceText)
  return template
}

function pick(array) {
  return array[Math.floor(Math.random() * array.length)]
}
```

Alternative:
```js
const template1 = 'The ${adjective} brown ${noun} ${adverb} ' +
                '${verb} the ${adjective} yellow ' +
                '${noun}, who ${adverb} ${verb} his ' +
                '${noun} and looks around.';

const template2 = "The ${noun} ${verb} the ${noun}'s ${noun}.";

function madlibs(template) {
  const REPLACEMENT_TEXTS = {
    adjective: ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'],
    noun: ['fox', 'dog', 'head', 'leg', 'tail'],
    verb: ['jumps', 'lifts', 'bites', 'licks', 'pats'],
    adverb: ['easily', 'lazily', 'noisily', 'excitedly'],
  };

  function replaceText(match) {
    const key = match.replace(/[^a-z]/g, '');
    const index = Math.floor(Math.random() * REPLACEMENT_TEXTS[key].length);
    return REPLACEMENT_TEXTS[key][index];
  }

  return template.replace(/\${[a-z]+}/g, replaceText);
}
```