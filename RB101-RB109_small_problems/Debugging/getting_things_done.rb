=begin
We wrote a method for moving a given number of elements from one array to another. 
We decide to test it on our todo list, but invoking move on line 11 results in a SystemStackError. 
What does this error mean and why does it happen?

def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
=end

## The `move` method was calling itself infinitely since we didn't give it instructions to stop, adding `unless n <= 1` fixes the issue

def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array) unless n <= 1
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

## Further Exploration
# What happens if the length of the from_array is smaller than n?
# -- `nil` values get added to the `to_array` array