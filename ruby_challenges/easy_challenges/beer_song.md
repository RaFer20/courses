Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

# *Problem*
We weren't given a lot of explicit information about what's required in the instructions. We need to extrapolate the requirements from the test cases. Pertinent information to keep in mind:

99 Bottles of Beer is a song with 100 verses. It begins with 99 bottles, and the number of bottles decreases until the number of bottles is 0 and there are "no more" bottles (the last verse).

Given that we need to produce the lyrics of the song, we can guess that we might need to return a string.

How are we going to handle verses that need a different grammatical syntax? e.g. 'bottles' versus 'bottle'.

The return value of the verses method should be a string that contains one verse of the song for every number between the first and second argument values, inclusive. The first argument should be greater than the second.

-   Each line of each verse should be separated by a newline.
-   Verses should be separated by a blank line (two consecutive newlines).


# *Examples*
From the test cases shown, we can see that we need to create a BeerSong class. The class should have 3 methods as follows:

verse accepts one argument, a number. The number indicates how many bottles of beer should be present in the verse returned. The return value is a string representing a single verse of the song.

verses accepts two number arguments. The first argument is the number verse on which to start, and the second argument represents the number verse on which to end. The method should return a string representing all verses in this range (inclusive).

lyrics expects no arguments and returns a string representing the entire song (all 100 verses) counting down from 99 to "no more".

We may also want to create some helper methods to assist us, but those are optional.

# *Data Structures*
We know that we will be working with strings, and using numbers to track our verses. We may also use an array to collect multiple verses before returning them as a single string.

# *Algorithm*
*Method: verse*

Each line of the verse (there are two) should be separated by a newline
All mentions of the number of bottles should be replaced with the method's argument.
Return the verse string

*Method: verses*

The second argument should be less than the first, but greater than or equal to zero.
The first argument should be less than 100.
We can start with an empty string or array to hold our results
Count down from the first argument to the second (inclusive)
Handle verses that need either the singular bottle or no more bottles.
The verse when one bottle remains starts out as "Take it down" instead of "Take one down".
Add the string verse for each of these numbers to our result
Return result as a string

*Method: lyrics*

Build up a string containing all 100 verses of the song.
The verses should count down from 99 to "no more".
Each line of the verse should be separated by a newline.
Each unique verse should be separated by a blank line (2 newlines).
Return the string containing full lyrics.