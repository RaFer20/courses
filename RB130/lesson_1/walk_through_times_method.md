Let's write our own times method that mimics the behavior of the `Integer#times` method. 

First, let's study the `Integer#times` method.

```ruby
5.times do |num|
  puts num
end
```

Invoking the `Integer#times` method produces this output:
```ruby
0
1
2
3
4
=> 5
```

Notice that the `Integer#times` method's first block argument is `0`, and the last block argument is 1 less than the calling object. Finally, the method returns the calling object, `5`.

Our `times` method will exhibit the same behavior, yielding to the block starting with `0` and going up to 1 less than the method argument. We don't have a calling object, but we do have a method argument, so we'll return that. In other words, we should be able to write the following code and get identical output as `Integer#times`:

```ruby
times(5) do |num|
  puts num
end
```


```ruby
# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number                      # return the original method argument to match behavior of `Integer#times`
end

# method invocation
times(5) do |num|
  puts num
end

# Output:
# 0
# 1
# 2
# 3
# 4
# => 5
```

1. Method invocation starts at line 13, when the times method is called with an argument, 5, and a block of code.
2. Execution enters the first line of the method implementation at line 3, where the local variable counter is initialized.
3. Execution continues to line 4. The while conditional is evaluated. The first time through, the condition is true.
4. Execution continues to line 5, which yields to the block. This is the same as executing the block of code, and this time, we are executing the block of code with an argument. The argument to the block is the counter, which is 0 the first time through.
5. Execution jumps to the block on line 13, setting counter to the block local variable num.
6. Execution continues in the block to line 14, which outputs the block local variable num.
7. Reaching the end of the block, execution continues back to the times method implementation on line 6, where the counter is incremented.
8. Reaching the end of the while loop, execution continues on line 4, essentially repeating steps 3 through 7.
9. At some point, the while conditional should return false (otherwise, you have an infinite loop), allowing execution to flow to line 9, which doesn't do anything.
10. Reaching the end of the method at line 10, execution will return the last expression in this method, which is the number local variable.


This example is made a little bit more complicated due to the `while` loop, but pay attention to the interplay between the method implementation and the block. From within the method, we are yielding execution to the block, and we are passing an argument to the block. When we call the method, we know that we must include a block that takes an argument.

In other words, *there are two separate roles here: the times method implementer and the user of the times method*. For example, let's call the method implementer Isaac, and the user Uni (Isaac the implementer, and Uni the user). Both are developers, so the roles here are just in relation to the times method.

Isaac wants to write a generic times method, and he doesn't know if users of the method will be outputting values, or adding them together, or whatever. All he wants to do is write a generic method that iterates up to a certain number. Using a block is a perfect use case; he can allow users of his method to use blocks to perform some action. But he doesn't know what that action is, so all he is responsible for is to yield to the block and pass to the block the current number. This is the inspiration for our implementation of our times method.

On the other hand, Uni has the need to iterate up to a certain number throughout her code. She finds Isaac's times method and decides to use it. She reads the documentation and finds some examples. This fits her needs perfectly, as long as she passes in an argument to the method, and a block that takes an argument. She can then be sure that the argument to her block is going to be a number starting from 0, up to 1 less than the argument she passed to the method. This is how Isaac implemented the method, and what he wrote in the documentation.

Up to this point, you've been Uni, using Integer#times or Array#each by relying on documentation. We're now starting to see how Isaac implements these methods, so you can start implementing these types of generic methods in your own code.