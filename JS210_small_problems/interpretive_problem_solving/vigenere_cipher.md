The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase letters 'A'-'Z' are also equivalent to 0-25.

Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character. To make this more concrete, let's look at the following example:
```js
plaintext: Pineapples don't go on pizzas!
keyword: meat

Applying the Vigenere Cipher for each alphabetic character:
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

result: Bmnxmtpeqw dhz'x gh ar pbldal!
```

Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').

# Problem
Write a function that takes a text and a keyword and implements the vigenere cipher on the text
if the input string is 'Hello' and keyword 'cat', match every letter to the corresponding letter in the keyword
and apply the caesar cipher for the shift value of that letter.
```js
H e l l o
c a t c a
```

# Examples/ Data Structures
```js
plaintext: Pineapples don't go on pizzas!
keyword: A

Applying the Vigenere Cipher for each alphabetic character:
plaintext: P i n e a p p l e s d o n t g o o n p i z z a s
shift:     A A A A A A A A A A A A A A A A A A A A A A A A
ciphertext: P i n e a p p l e s d o n t g o o n p i z z a s

result: Pineapples don't go on pizzas!
###########################################################
plaintext: Pineapples don't go on pizzas!
keyword: Aa

Applying the Vigenere Cipher for each alphabetic character:
plaintext: Pi ne ap pl es do nt go on pi zz as
shift:     Aa Aa Aa Aa Aa Aa Aa Aa Aa Aa Aa Aa
ciphertext: Pi ne ap pl es do nt go on pi zz as

result: Pineapples don't go on pizzas!
###########################################################
plaintext: Pineapples don't go on pizzas!
keyword: cab

Applying the Vigenere Cipher for each alphabetic character:
plaintext: Pin eap ple sdo ntg oon piz zas
shift:     cab cab cab cab cab cab cab cab
ciphertext: Rio gaq rlf udp pth qoo ria bat

result: Riogaqrlfu dpp't hq oo riabat!
###########################################################
plaintext: Dog
keyword: Rabbit

Applying the Vigenere Cipher for each alphabetic character:
plaintext: Dog
shift:     Rab
ciphertext: Uoh

result: Uoh
###########################################################
```



# Data Structures
Strings

# Algorithm
initialize `fullKey` to the value of `keyword`
initialize `keyIdx` to `0`
initialize `newText` to an empty string

concat `keyword` to `fullKey` until it's length is equal to or greater than `text`

start a for loop
- if text[i] is a letter invoke `caesarEncrypt` with `text[i]` and the index of `fullKey[j]` in alphabet, concat the return value to `newText` and increment `j`
- else concat text[i] to `newText`
return `newText`

# Code
```js
const alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');

function caesarEncrypt(str, n) {
  let newString = '';

  for (let i = 0; i < str.length; i += 1) {
    if (/[a-z]/i.test(str[i])) {
      let idx = alphabet.indexOf(str[i].toLowerCase());
      let target = n + idx
      while (target >= alphabet.length) {
        target -= alphabet.length;
      }

      if (str[i] === str[i].toUpperCase()) {
        newString += alphabet[target].toUpperCase();
      } else {
        newString += alphabet[target];
      }
    } else {
      newString += str[i];
    }
  }
  return newString;
}

function vigenereEncrypt(text, keyword) {
  let fullKey = keyword;
  let newText = '';
  let keyIdx = 0;

  while (text.length > fullKey.length) {
    fullKey += keyword;
  }
  
  for (let i = 0; i < text.length;i += 1) {
    if (/[a-z]/i.test(text[i])) {
      newText += caesarEncrypt(text[i], alphabet.indexOf(fullKey[keyIdx].toLowerCase()))
      keyIdx += 1;
    } else {
      newText += text[i];
    }
  }
  return newText;
}
```

Alternative:
```js
function vigenereEncrypt(plaintext, keyword) {
  const upperAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const lowerAlphabet = 'abcdefghijklmnopqrstuvwxyz';
  let ciphertext = '';
  let keyPos = 0;
  keyword = keyword.toUpperCase();
  let key;

  plaintext.split('').forEach(char => {
    if (char >= 'A' && char <= 'Z') {
      key = upperAlphabet.indexOf(keyword[keyPos]);
      ciphertext += encrypt(char, key, upperAlphabet);
      keyPos = (keyPos + 1) % keyword.length;
    } else if (char >= 'a' && char <= 'z') {
      key = upperAlphabet.indexOf(keyword[keyPos]);
      ciphertext += encrypt(char, key, lowerAlphabet);
      keyPos = (keyPos + 1) % keyword.length;
    } else {
      ciphertext += char;
    }
  });

  return ciphertext;
}

function encrypt(letter, key, alphabet) {
  const letterPos = alphabet.indexOf(letter);

  for (let step = 1; step <= key; step += 1) {
    if (!alphabet[letterPos + step]) {
      alphabet += alphabet;
    }

    letter = alphabet[letterPos + step];
  }

  return letter;
}
```