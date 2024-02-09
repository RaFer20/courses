=begin
In this assignment, let's implement a reduce method, similar to Enumerable#reduce.
Before we do so, let's get (re-)acquainted with the Enumerable#reduce method.
`reduce` is another name for the `inject` method, and its main goal is to "fold" or "accumulate" a collection into 1 object.
What the specific folding or accumulation mechanism is depends on the code passed in to the block.
Let's take the typical example and sum up an array of integers.

[1, 2, 3].reduce do |acc, num|
  acc + num
end

# => 6

Let's take this method apart. The [1, 2, 3] is the caller; the reduce is the method call; and the do ...end is the block.
The reduce method iterates through the array, and unlike each where it only yields 1 argument to the block,
the reduce method yields two arguments to the block.
The first argument is an accumulator object, and the second argument is the current element.

The return value of the block is then assigned to the accumulator object. Therefore, the below code is incorrect.

[1, 2, 3].reduce do |acc, num|
  acc + num if num.odd?
end

# => NoMethodError: undefined method `+' for nil:NilClass

You might have expected the answer to be 4, thinking that the code will add up 1 and 3 together, skipping 2.
However, remember what the reduce method does: it sets the accumulator to the return value of the block,
and then passes the accumulator to the block on the next yield. When it got to 2, the line acc + num if num.odd? returned nil.
The accumulator is now set to nil, and the next time reduce yielded to the block, this accumulator (which is now nil) was passed to the block.
That's why we get the NoMethodError. Note that if our array is [1, 2], the above code will return nil,
because after iterating through the array, it returns the accumulator (which is nil since it's not odd).

Another interesting behavior for the Enumerable#reduce method is that you can initialize the accumulator to a default value.
For example, let's say we wanted to add up all the elements of an array, but we wanted to start the accumulator from 10.
We can do this:

[1, 2, 3].reduce(10) do |acc, num|
  acc + num
end

# => 16

This initializes the accumulator object from 10, so each iteration through the array will add the current element to the accumulator,
and then set the accumulator to the return value of the block.
In the end, we get 16, instead of 6.

Try to write a reduce method on your own that exhibits this behavior.
Your reduce should take at least 1 argument that represents the array we'll operate on.
It should also take an optional second argument that represents the default value for the accumulator.
Here's a few examples that we should be able to call on your method.

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
=end

def reduce(array, accumulator=0)
  counter = 0
  
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

=begin
Comparison with Enumerable#reduce

If you take a close look at the real reduce method in the Enumerable module, you'll see that the real reduce is far more flexible and powerful.
It contains many features our reduce method that we wrote above doesn't consider.

While we could think about adding some of those features,
it will stretch our code beyond the core concepts in this lesson,
which is learning to work with blocks.

For that reason, we'll leave our reduce method without these additional features
in order to focus on the primary purpose of learning to implement methods that yield to a block.

One other thing you may notice is that we use a number (0) as the default initial value for the accumulator,
which limits us: we can't use our version with a default value if the data is non-numeric.
Compare this to Enumerable#reduce where the default initial value is the first element of the collection.

For an extra challenge, how would you implement this improved default behavior? Try it on your own.
To verify that your solution works, try these test cases:

reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
=end

def reduce(array)
  counter = 1
  accumulator = array[0]
  
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']