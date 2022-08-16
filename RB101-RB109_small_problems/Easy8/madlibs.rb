# Mad libs are a simple game where you create a story template with blanks for words.
# You, or another player, then construct a list of words and place them into the story,
# creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

=begin
**Problem**
Write a simple program the prompts for a noun, verb, adverb and adjective and injects them into a story.


**Example/Test Cases**
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

**Data Structures**
Input: Words prompted by the program
Output: A story including the input words

**Algorithm**
Prompt the user for words to use in the story
Interpolate those words into a string
output the string

**Code**
=end

puts "Enter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an adjective:"
adjective = gets.chomp

puts "Enter an adverb:"
adverb = gets.chomp

puts "Does your #{adjective} #{noun} know how to #{verb} #{adverb}? That's Great!"