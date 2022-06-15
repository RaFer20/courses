# Write a program that will ask a user for an input of a word or multiple words
#  and give back the number of characters. Spaces should not be counted as a character.

puts "Please write a word or multiple words:"
word = gets.chomp
characters = word.delete(' ').size

puts "There are #{characters} characters in #{word}"