Let's now try to apply what we know about blocks and build our own `each` method. By now, you should be very familiar with the `Array#each` method, and we'll be using that method as our inspiration. One subtlety to note, though, is that the `Array#each` method returns the calling object at the end. Example:

```ruby
[1, 2, 3].each { |num| "do nothing" }                           # still returns [1, 2, 3]
```

So what happens is that the `Array#each` method iterates through the array, yielding each element to the block, where the block can do whatever it needs to do to each element. Then, the method returns the calling object. This is so developers can chain methods on afterwards, like this:

```ruby
[1, 2, 3].each{|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3]
```

Let's write our own each method that takes an array, and exhibits the same behaviors as `Array#each`.

```ruby
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])                           # yield to the block, passing in the current element to the block
    counter += 1
  end

  array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end
```

Note that we used a loop (specifically, a while loop) in the implemention of the `each` method. We could have as well used the `Array#each` method, since we're passing in an Array object, but that somehow would have felt like cheating. In any case, writing our own loop is easy enough.

Let's see how our each method behaves:

```ruby
each([1, 2, 3, 4, 5]) do |num|
  puts num
end

# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]
```

The entire magic of our `each` method relies on the fact that our method does not implement what action to perform when iterating through the array. Do we increment every value by one? Do we output the element? None of that matters, because our `each` method is solely focused on iterating and not on anything beyond that. Writing a generic iterating method allows method callers to add additional implementation details at method invocation time by passing in a block. This is why when we implemented the method, we yield to the block. 

Note that the trick here is to pass the current element we're working with to the block. At each iteration within the while loop, execution then goes to the block (with the current element as the block argument), and will return execution back to the while loop after executing the block. Then, counter is incremented and the while loop continues and the next element is yielded to the block.