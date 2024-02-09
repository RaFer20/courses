# String Processing Patterns
String or text processing is the manipulation of text-based content. It usually follows this pattern:
1. Declare a new string or array to use as a container for the result. Declarations may occur anywhere.
2. Break down or parse the original string. Typically, you will break strings down by line, sentence, word, character, or by the presence of delimiters. Remove any unneeded characters from the text.
3. Depending on the shape of the problem, apply a suitable list processing strategy.
4. Combine the individual results into a new string if needed.

You can also use *Regular Expressions* to process strings or text. Regular expressions use a sequence of "patterns" that define or create a search criterion. Each pattern searches for a sequence of characters that match the pattern. You can use the results to perform search and replace, list building, or text validation operations (this is not an exhaustive list).

## Examples
Scenario: We need to capitalize the first letter of every word in some text.

Shape of the problem: This is straight-forward: we have some words and we must transform each word by capitalizing the first letter.
```js
let text = 'The quick brown fox jumps over the lazy dog.';

function capitalize(text) {
  // break original string into words
  let textArray = text.split(' ');

  // declare result array and perform list processing - transformation
  let newTextArray = textArray.map(word => {
    return word[0].toUpperCase() + word.slice(1);
  });

  // join together
  return newTextArray.join(' ');
}

capitalize(text);    // "The Quick Brown Fox Jumps Over The Lazy Dog."
```


Scenario: Count how often a specific word occurs in some text.

Shape of the problem: Given some words, locate the words that match the word we want to count, then count the words we found.

The criteria we use to find words that match, influences the overall problem shape. Here, we want to exclude characters that aren't letters, and we want to perform case-insensitive comparisons when searching for the specific word.
```js
let text = 'The quick brown fox jumps over the lazy dog.';

function countWordInText(word, text) {
  // `replace` creates a new string
  let textArray = text.replace(/[^a-z ]/ig, '').split(' ');

  // filter/select only the needed words
  return textArray.filter(wordInText => {
    return word.toLowerCase() === wordInText.toLowerCase();
  }).length;
}

countWordInText('the', text);    // 2
countWordInText('dog', text);    // 1
```
Note that we use a regular expression to remove all non-alphabetic characters.