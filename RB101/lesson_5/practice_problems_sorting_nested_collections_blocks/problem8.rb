# Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.values.each do |array|
  array.each do |string|
    string.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
