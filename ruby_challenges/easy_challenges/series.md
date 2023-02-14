Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.

# *Problem*
For our program, the details we need to keep in mind are as follows:

We'll be given two important values: a string of numerical digits & a number representing the desired length of the series.
Each possible series we extract must be consecutive numbers from the original string. That means, from the string '01234', '213' is not a valid option, but '123' is.

- The slices method should throw an error if the length is invalid.
- How can we create substrings that are the proper length?

# *Examples*
From the test cases shown above, we can see that we need to create a Series class. The class should have 2 methods as follows:

a constructor that accepts a string of digits as an argument
a slices method that takes a number as an argument. That number is the length of the possible series we must determine. We can see from the provided test cases that the return value of this method is an array of arrays. Each sub-array contains a series of numbers.
Note that if the length is greater than the length of the number string, we need to throw an error.

We may also want to create some helper methods to assist us, but those are optional.

# *Data Structures*
We are using both strings and numbers. We also need to use a collection to return all possible number series. We noted above under the 'Test Cases' heading that our series method should return an array. Each element of that array is itself an array, containing the digits of each series.

# *Algorithm*
constructor

Save the string of digits passed as an argument
Method: slices

Accept a number as an argument — the length.
Throw an error if the length is greater than the length of the number string
Starting with the first digit in the number string, create substrings of length size.
Save the digits of each substring (the series) into an array.
Return an array of arrays that contains every series.