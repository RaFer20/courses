Write some code that converts modern decimal numbers into their Roman number equivalents.

The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of straight lines and are hence easy to hack into stone tablets.

1  => I
10  => X
7  => VII
 
There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:
1000=M
900=CM
90=XC

2008 is written as MMVIII:
2000=MM
8=VIII

# *Problem*
For our program, the details we need to keep in mind are as follows:

- I stands for 1
- V stands for 5
- X stands for 10
- L stands for 50
- C stands for 100
- D stands for 500
- M stands for 1,000
- We don't have to worry about numbers higher than 3,000.
- Modern Roman numerals are written by expressing each digit of the number separately, starting with the left most digit and skipping any digit with a value of zero

We need one instance method named toRoman that returns the Roman number as a string based on the value of the number defined by the constructor.

# *Examples*
From the test cases shown above, we can see that we need to create a RomanNumeral class. The class should have 2 methods as follows:

A constructor that accepts a non-Roman integer number as an argument. From the test cases, it appears that the constructor does not raise any errors.

A method that returns the Roman numeral representation of that number as a string. The name of this method will be either to_roman or toRoman depending on the conventions for your programming language of choice.

We may also want to create some helper methods to assist us, but those are optional.


# *Data Structures*
Our input is an integer in our language of choice, and our output is a string. We may want to use some type of collection to help us create the desired output since it can make iteration easier. It might also be a good idea to have another collection hold some key conversions between numbers and Roman numerals.

We may also need a separate collection that holds key conversions between numbers and Roman numerals. How would ascending or descending order impact its ease of use?

# *Algorithm*

## *constructor*
- Accept a number as an argument.
- Save it for later use.

## *Roman Numerals Collection*
- Create a collection that links important Roman numeral strings to their numeric counterparts.
- Ensure this is in descending order.

## Method: *Convert to Roman Numerals (Ruby: to_roman; JavaScript: toRoman)*
- Initialize a variable with an empty string to save the finished Roman conversion.
- Iterate over the Roman Numerals collection:
-- If the numeric value of the current Roman numeral is less than the value of the input number, add the Roman numerals to the string as many times as its value can fit. For instance, if the current Roman numeral is C (which has a value of 100) and the input number is 367, then 3 C's are needed: CCC.

-- Subtract the numeric value of the added Roman numerals from the current input value, and use the new input value in subsequent iterations. For instance, since we added CCC to the string above, we must subtract 300 from 367, leaving us with a new input number of 67.

- Return the result string.