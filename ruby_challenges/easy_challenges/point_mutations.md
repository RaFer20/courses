Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA.
Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell.
Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute.
In fact, the macro effects of evolution are attributable to the accumulated result of beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor,
we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

This is called the Hamming distance.
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length.
If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.


# *Problem*
For our program, the details we need to keep in mind are as follows:

We will be given two strands of DNA.
We need to count the differences between them.
If one strand is shorter than the other, we only need to check for differences for the length of the shorter strand.

Method for calculating Hamming distance:
How can we know which DNA strand is shorter?
How can we count the differences between them? What kind of iteration will help us do that?

# *Examples*
From the test cases shown above, we can see that we need to create a DNA class. The class should have 2 methods as follows:

A constructor that accepts a DNA strand string as argument. The constructor does not raise any errors.

A method that accepts a second DNA strand string as an argument and returns the differences between the two strands — the Hamming distance.

We may also want to create some helper methods to assist us, but those are optional.

# *Data Structures*
We're given the DNA strands as strings. Additionally, we may want to use a collection to help us iterate through each character of the DNA strand.

# *Algorithm*

constructor

Accept a DNA strand string as an argument.
Save it for later use.
Method: Compute Hamming Distance (Ruby: hamming_distance; JavaScript: hammingDistance)

Compare the lengths of both DNA strands to determine which is shorter.
Set a counter to 0.
Based on the shorter strand's length, iterate through both DNA strand strings, at the same index, and compare each character.
If the characters are different, increase the counter.
Continue to the next index position.
Return the counter.