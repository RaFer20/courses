Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

# *Problem*
Some items from the instructions we want to keep in mind:

Our input is a word and a list of words. The first input is the pattern string, and the second input is an array of strings that may be anagrams of the pattern string.
From the instructions we can see that words are anagrams of each other when they have the same number of letters and the same exact letters as each other. Notice that enlists isn't an anagram of listen since it has an extra 's'.

We can iterate over the list of possible anagrams and save those that are indeed anagrams.
Anagrams must:
be the same length
have the same exact letters
have the exact same number of the exact same letters. Letters cannot be reused.
One way to check for anagrams is to sort both the characters in the pattern and the possible anagram in the same way and check whether they are equal to each other:

pattern:  enlists       sorted: eilnsst
word:     listens       sorted: eilnsst

Since both "enlists" and "listens" have the exact same list of characters when sorted, the two words are anagrams of each other.

# *Examples*
From the test cases shown above, we can see that we need to create an Anagram class. The class should have 2 methods as follows:

a constructor that takes the pattern word as an argument
a match method that takes a list of words as an argument (to test against the pattern we initialized in the constructor)
We may also want to create some helper methods to assist us, but those are optional.

The test cases confirm what the instructions suggested: anagrams must (a) be the same length, (b) have the same exact letters, and (c) have the exact same number of the exact same letters. Letters cannot be reused.

Additionally, a word is not an anagram of itself (e.g. corn is not an anagram of corn). Anagrams are not case sensitive -- Orchestra and Carthorse are anagrams of each other.

Whether 0 anagrams, 1 anagram, or 5 anagrams are found, we need to return the output as an array — either of strings (when at least 1 anagram is found) or an empty array (in the case of 0 anagrams).

# *Data Structures*
From the test cases, we can see that we're dealing with strings. We may want to use a collection (such as an array) for helpful built-in methods.

# *Algorithm*

*constructor*

save the argument in lowercase


*Method: match*

Initialize an empty list for the anagrams
Iterate over each word in the argument list
Convert word to lowercase
Is word an anagram of the word saved in the constructor?
Yes. Add this word to list of anagrams.
Return the list of anagrams.

*Helper method to detect anagrams*

Takes two arguments: the original word and the current word
Are the two words the same?
Yes. Return false.
Extract and sort all letters of the original word.
Extract and sort all letters of the current word.
Are the two sorted lists of letters the same?
Yes. Return true (the words are anagrams)
No. Return false (the words are not anagrams)