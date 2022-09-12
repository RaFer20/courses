=begin
A collection of spelling blocks has two letters per block, as shown in this list:
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. 
Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

**Problem
Write a method that checks if word passed in as an argument can be spelled with this set of blocks and returns true or false
-Each block can only be used once
-Can only use one side of the block

**Examples/Test Cases
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

**Data Structures
Input: string
Output: boolean

BET => true
BAN => false

**Algorithm
Initialize a `blocks` variable as an array of arrays, each subarray being a block
Reassign `string` to the value of calling `upcase` on itself
Iterate through the blocks array and check for each array if any of its elements are included in the input string
-If they are clear that subarray
-Else go to the next iteration

If the amount of empty blocks is equal to the number of characters in the string return true

**Code
=end

def block_word?(string)
  blocks = [
  ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
  ['V', 'I'], ['L', 'Y'], ['Z', 'M']
  ]
  string = string.upcase

  blocks.each do |block|
    if string.upcase.include?(block.first) || string.include?(block.last)
      block.clear
    else
      next
    end
  end
  blocks.count([]) == string.chars.count
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('BET') == true
p block_word?('BAN') == false