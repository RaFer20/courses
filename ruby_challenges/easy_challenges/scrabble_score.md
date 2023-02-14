Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:
Letter	                        Value
A, E, I, O, U, L, N, R, S, T	  1
D, G	                          2
B, C, M, P	                    3
F, H, V, W, Y	                  4
K	                              5
J, X	                          8
Q, Z	                          10

How to Score

Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E

Thus, to compute the final total (14 points), we count:

3 + 2 * 1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

# *Problem*
For our program, the details we need to keep in mind are as follows:

Our input will be a word for which we need to calculate the Scrabble score.
The numeric value for letters is already determined for us:
A, E, I, O, U, L, N, R, S, T — 1 point
D, G — 2 points
B, C, M, P. — 3 points
F, H, V, W, Y — 4 points
K — 5 points
J, X — 8 points
Q, Z — 10 points
Each letter, even if repeated, counts towards the total.

We need two methods named score: one is an instance method, the other is a class or static method.

We should deal with invalid letters in the score instance method.
The score class/static method can take advantage of the constructor and the score instance method.

# *Examples*
From the test cases shown above, we can see that we need to create a Scrabble class. The class should have 3 methods as follows:

A constructor that accepts a Scrabble word as its argument.

A score method that calculates the score of the Scrabble word defined by the constructor. score takes no arguments and returns the score for the word. From the test cases, we can see that:

Invalid words should return a score of 0.
Words are case-insensitive (abc and ABC represent the same word).
A class or static method also named score. Class and static methods are not executed by instances of the main class, but by the class itself. This version of score takes a single argument that contains the desired Scrabble word and returns its score.

We may also want to create some helper methods to assist us, but those are optional.

# *Data Structures*
Our input is usually a string, but we also need to deal with invalid input. It may be helpful to also use an array to calculate the score, and an object to keep track of our scoring standard.

# *Algorithm*
*constructor*

Accept a Scrabble word as an argument and save it for later use.
Ignore bad input at this point.

*Method: score*

Return 0 if word is invalid.
Iterate through each letter and increment score by value of each letter.
Return the final score.

*Method: score (static or class method)*

Accept a Scrabble word as an argument.
We can leverage the constructor and score method described above.
Return the score.