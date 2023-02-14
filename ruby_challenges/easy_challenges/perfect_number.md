The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories of abundant, perfect, or deficient based on a comparison between the number and the sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

- Perfect numbers have an Aliquot sum that is equal to the original number.
- Abundant numbers have an Aliquot sum that is greater than the original number.
- Deficient numbers have an Aliquot sum that is less than the original number.

Examples:

- 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
- 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
- 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
- 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
- Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

Write a program that can tell whether a number is perfect, abundant, or deficient.

# *Problem*
For our program, the details we need to keep in mind are as follows:

We'll be given a number and we need to determine whether it is abundant, perfect, or deficient.
Perfect: Sum of factors = number
Abundant: Sum of factors > number
Deficient: Sum of factors < number
Factors are the numbers less than the input number that can be evenly divided into it. For example, the number 6 can be evenly divided by 1, 2, and 3.

- Throw an error if the input is negative
- How can we efficiently find all of the factors of the given number?
- We also need to sum all of the factors.
- Once we have the sum, we can classify the number and return the result.
- A number is a divisor of another number if the remainder of dividing the second number by the first is 0. For example, 7 is a divisor of 21 since 21 % 7 is 0. However, 7 is not a divisor of 23 since 23 % 7 is not 0 -- it is 2.

# *Examples*
From the test cases shown above, we can see that we need to create a PerfectNumber class. The class should have 1 method:

It accepts a number as an argument and returns the appropriate string based on its classification: "perfect", "abundant", or "deficient".
We can also see that we need to throw an error when the input to the above method is a negative number.

We may also want to create some helper methods to assist us, but those are optional.

# *Data Structures*
In addition to working with numbers, it may also be helpful to use a collection that can hold a range. This could prove useful in finding all of the divisors of a given number.

# *Algorithm*
*Method: classify*

Throw error if the argument is less than 1.
Find the sum of all factors of argument (helper method)
If sum is equal to argument, return "perfect".
If sum is greater than argument, return "abundant".
If sum is less than argument, return "deficient".

*Helper Method: determine sum of factors*

Initialize sum to 0
Iterate over numbers from 1 up to 1 less than the argument.
If number is a divisor of the argument, add number to sum
Return sum