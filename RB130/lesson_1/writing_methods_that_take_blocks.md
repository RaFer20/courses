Every method you have ever written in Ruby already takes a block. Let's implement a simple method.

```ruby
def hello
  "hello!"
end

hello  # => "hello!"
```

That's about as simple of a method as you can get; it just returns the string "hello!" when you call it.
Let's try to call it with an argument.

```ruby
hello("hi") # ArgumentError: wrong number of arguments (1 for 0)
```

This doesn't work, because the hello method isn't expecting any arguments. What if we called it with a block?

```ruby
hello { puts 'hi' }    # => "hello!"
```

In Ruby, every method can take an optional block as an implicit argument. You can just tack it on at the end of the method invocation, just like we did above when calling the hello method. 

```ruby
def echo(str)
  str
end

echo                    # ArgumentError: wrong number of arguments (0 for 1)
echo("hello!")          # => "hello!"
echo("hello", "world!") # ArgumentError: wrong number of arguments (2 for 1)

# this time, called with an implicit block
echo { puts "world" }                    # ArgumentError: wrong number of arguments (0 for 1)
echo("hello!") { puts "world" }          # => "hello!"
echo("hello", "world!") { puts "world" } # ArgumentError: wrong number of arguments (2 for 1)
```

It's almost as if the block wasn't even being passed to the method. How can we be sure that the method actually has access to the block?

##########################################################################################################################################
# *Yielding*

One way that we can invoke the passed-in block argument from within the method is by using the yield keyword. 

```ruby
def echo_with_yield(str)
  yield
  str
end

echo_with_yield { puts "world" } # ArgumentError: wrong number of arguments (0 for 1)
echo_with_yield("hello!") { puts "world" }          # world
                                                    # => "hello!"
echo_with_yield("hello", "world!") { puts "world" } # ArgumentError: wrong number of arguments (2 for 1)
```

Seeing these results tells us two things:
- *The number of arguments at method invocation needs to match the method definition, regardless of whether we are passing in a block.*
- *The yield keyword executes the block.*

If your method implementation contains a `yield`, a developer using your method can come in after this method is fully implemented and inject additional code in the middle of this method (without modifying the method implementation), by passing in a block of code. This is indeed one of the major use cases of using blocks, which we'll talk more about later.

Let's take a look at a common edge case. Let's continue using our `echo_with_yield` method from above, but we're now calling it like this:

```ruby
echo_with_yield("hello!") # LocalJumpError: no block given (yield)
```

If you ever see that error message, you should guess that the method implementation has a `yield` in it somewhere, but we didn't include a block at method invocation. That's exactly the case here.

In order to allow calling the method with or without a block, we must somehow wrap the `yield` call in a conditional: only call `yield` when a block is passed to the method and don't call `yield` when there's no block. We can achieve this with the Kernel#block_given? method. And because it's in Kernel, it's available everywhere. Let's modify `our echo_with_yield` implementation:

```ruby 
def echo_with_yield(str)
  yield if block_given?
  str
end

echo_with_yield("hello!")                  # => "hello!"

echo_with_yield("hello!") { puts "world" } # world
                                           # => "hello!"
```
##########################################################################################################################################
## *Passing Execution to the block*

```ruby
# method implementation
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end  # clears screen first, then outputs "> hi there"
```

Before we can trace the code execution, we have to be clear that the `def say...` code is the method implementation, and the `say...` code is the method invocation. There is only one method here: say.

*Once that's clear, we can start tracing the code execution:*
1. Execution starts at method invocation, on line 8. The say method is invoked with two arguments: a string and a block (the block is an implicit parameter and not part of the method definition).
2. Execution goes to line 2, where the method local variable words is assigned the string "hi there". The block is passed in implicitly, without being assigned to a variable.
3. Execution continues into the first line of the method implementation, line 3, which immediately yields to the block.
4. The block, line 9, is now executed, which clears the screen.
5. After the block is done executing, execution continues in the method implementation on line 4. Executing line 4 results in output being  displayed.
6. The method ends, which means the last expression's value is returned by this method. The last expression in the method invokes the puts method, so the return value for the method is nil.

line 8 → line 2 → line 3 → line 9 → line 4 → line 5

Notice the jump after line 3: execution jumps to somewhere else, then comes back to finish the rest of the method. This is very similar to calling a method, except here we're calling a block. This is why it's sometimes useful to think of a block as an un-named or anonymous method.
##########################################################################################################################################

# *Yielding with an argument*

Sometimes, the block we pass in to a method requires an argument. Note that the block itself is an argument into a method, so the fact that the block requires an argument adds an additional layer of complexity.

```ruby
3.times do |num|
  puts num
end
```

`3` is the calling object.
`times` is the method being called.
`do...end` is the block.

The `num` variable between the two `|`'s is a parameter for the block, or, more simply, a *block parameter*. Within the block, `num` is a *block local variable*. This is a special type of local variable where the *scope is constrained to the block*.

It's important to make sure the block parameter has a unique name and doesn't conflict with any local variables outside the scope of the block. Otherwise, you'll encounter variable shadowing. Shadowing makes it impossible to access the variable defined in the outer scope, which is usually not something we want want.


Suppose we want to write a method called increment that takes a number as an argument, and returns the argument incremented by 1. At implementation time, we don't want to output the incremented number, because we aren't sure how users will use this method. The only thing we can be sure of is that the method should take an argument and return the argument plus 1.

```ruby
# method implementation
def increment(number)
  number + 1
end

# method invocation
increment(5)          # => 6
```

The method invocation returns `6`. But we want to allow users to possibly take some action on the newly incremented number at method invocation time. For example, maybe some users want to print it out or others want to log it to a file, or send it to Twitter. We want to allow for some flexibility at method usage or invocation time. Blocks are perfect for this. Let's update the implementation to yield to a block, and pass in the incremented number into the block.

```ruby
# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
```
1. Execution starts at method invocation on line 10.
2. Execution moves to the method implementation on line 2, which sets 5 to the local variable number, and the block is not set to any variable; it's just implicitly available.
3. Execution continues on line 3, which is a conditional.
4. Our method invocation has indeed passed in a block, so the conditional is true, moving execution to line 4.
5. On line 4, execution is yielded to the block (or the block is called), and we're passing number + 1 to the block. This means we're calling the block with 6 as the block argument.
6. Execution jumps to line 10, where the block parameter num is assigned 6.
7. Execution continues to line 11, where we output the block local variable num.
8. Execution continues to line 12, where the end of the block is reached.
9. Execution now jumps back to the method implementation, where we just finished executing line 4.
10. Execution continues to line 5, the end of the if.
11. Line 6 returns the value of the incremented argument to line 10.
12. The program ends (the return value of #increment is not used)

line 10 → line 2 → line 3 → line 4 → line 10 → line 11
        → line 12 → line 4 → line 5 → line 6 → line 10
        → program ends

In this case, we're even passing an argument to the block, just like we could for any normal method.


What would happen if I pass in the wrong number of arguments to a block? Would Ruby raise an ArgumentError, like it would for normal methods? 
```ruby
# method implementation
def test
  yield(1, 2) # passing 2 block arguments at block invocation time
end

# method invocation
test { |num| puts num } # expecting 1 parameter in block implementation
```

Surprisingly, the above code outputs `1`. The extra block argument is ignored!
What if we pass in 1 less block argument, instead of passing in 1 more?

```ruby
# method implementation
def test
  yield(1)    # passing 1 block argument at block invocation time
end

# method invocation
test do |num1, num2| # expecting 2 parameters in block implementation
  puts "#{num1} #{num2}"
end
```

Even more surprisingly, this also outputs `1`. But this output is different from the previous one. In this case, num2 block local variable is nil, so the string interpolation converted that to an empty string, which is why we get `1 `(there's an extra space).

The rule regarding the number of arguments that you must pass to a block, proc, or lambda in Ruby is called its arity. In Ruby, blocks and procs have lenient arity, which is why Ruby doesn't complain when you pass in too many or too few arguments to a block. Methods and lambdas, on the other hand, have strict arity, which means you must pass the exact number of arguments that the method or lambda expects. For now, the main thing you should remember about arity is that methods enforce the argument count, while blocks do not.

*Arguments in Ruby are an extremely complex topic. The above description of arity glosses over this complexity and ignores things like optional arguments, variable arguments, and variable keyword arguments. Importantly, if your method or block allows any kind of optional arguments, the arity rules do not apply to those arguments.*

##########################################################################################################################################
# *Return value of yielding the block*

Suppose we want to write a method that outputs the before and after of manipulating the argument to the method.
```ruby
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# method invocation
compare('hello') { |word| word.upcase }
```
The output from the method invocation is:
Before: hello
After: HELLO
=> nil

From the above example, you can see that the after local variable in the `compare` method implementation is assigned the return value from the block. This is yet another behavior of blocks that's similar to normal methods: *they have a return value, and that return value is determined based on the last expression in the block*. This implies that just like normal methods, blocks can either mutate the argument with a destructive method call or the block can return a value. Just like writing good normal methods, writing good blocks requires you to keep this distinction in mind. Note that the last line, `=> nil`, is the return value of the `compare` method, and isn't related to what we're doing in the block. The last expression in the `compare` method is a `puts`, and therefore the return value of calling `compare` is always `nil`.

We could further call this compare method with a variety of different block implementations.

```ruby
compare('hello') { |word| word.slice(1..2) }

# Before: hello
# After: el
# => nil

compare('hello') { |word| "nothing to do with anything" }

# Before: hello
# After: nothing to do with anything
# => nil
```

In the above two examples, pay attention to the return value from the block. That's what the compare method implementation is relying on to display in the "After" scenario. Once you understand the basic use case of our compare method, let's study a slightly trickier example.

```ruby
compare('hello') { |word| puts "hi" }

# Before: hello
# hi
# After:
# => nil
```
In this case "After" displays nothing because the return value of the block is `nil` because the last evaluated statement is a `puts` call.

##########################################################################################################################################
# *When to use blocks in your own methods*

There are many ways that blocks can be useful, but the two main use cases are:
## 1. **Defer some implementation code to method invocation decision.**

There are two roles involved with any method: the `method implementor` and the `method user` (note that this could be the same person/developer). There are times when the `method implementor` is not 100% certain of how the method will be called. Maybe the `method implementor` is 90% certain, but wants to leave that 10% decision up to the `method user` at method invocation time.

Without using blocks, the method implementor can allow method users to pass in some flag. For example, take our compare method above. Suppose we don't use blocks. We can still achieve similar functionality, like this:
```ruby
def compare(str, flag)
  after = case flag
          when :upcase
            str.upcase
          when :capitalize
            str.capitalize
          # etc, we could have a lot of 'when' clauses
          end

  puts "Before: #{str}"
  puts "After: #{after}"
end

compare("hello", :upcase)

# Before: hello
# After: HELLO
# => nil
```
This isn't nearly as flexible as providing a way for method users to refine the method implementation, without actually modifying the method implementation for everyone else. By using blocks, the method implementor can defer the decision of which flags to support and let the user decide at method invocation time.

The method implementor is saying "hey, I don't know what the specifics of your scenario are, so just pass them in when you need to call this method. I'll set it up so that you can refine it later, since you understand your scenario better."

Many of the core library's most useful methods are useful precisely because they are built in a generic sense, allowing us (the code that calls the method) to refine the method through a block at invocation time. For example, take the `Array#select` method. We love the `select` method because we can pass in any expression that evaluates to a boolean in the block parameter. Imagine that instead of a flexible `select` method, we had `select_odds` or `select_greater_than(num)`. The latter methods would still work, but not be nearly as flexible and we'd have to memorize all the method names for that specific scenario. Instead, the `select` method is built in a generic way, allowing the method user to pass in the refinement to the method implementation.

*If you encounter a scenario where you're calling a method from multiple places, with one little tweak in each case, it may be a good idea to try implementing the method in a generic way by yielding to a block.*

## 2. **Methods that need to perform some "before" and "after" actions - sandwich code.**

### Sandwich code is a good example of the previous point about deferring implementation to method invocation. There will be times when you want to write a generic method that performs some "before" and "after" action. Before and after what? That's exactly the point -- the method implementor doesn't care: before and after anything. Let's explore an example. Suppose we want to write a method that outputs how long something takes. Our method doesn't care what that something is; our method just cares about displaying how long it took. The outline of our method could look like this:

```ruby
def time_it
  time_before = Time.now
  # do something
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end
```

The question for the method implementor is: what do we fill in for "do something"? The answer is: nothing. As the method implementor, we don't care what code goes there. The responsibility for our method starts and stops at timing the action, without regard to what the actual action is. This is a good use case for blocks. Using blocks, we can let method users specify any action, and use our method to time that action. Let's update the method implementation to yield to the block.

```ruby
def time_it
  time_before = Time.now
  yield                       # execute the implicit block
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }              # It took 3.003767 seconds.
                                  # => nil

time_it { "hello world" }         # It took 3.0e-06 seconds.
                                  # => nil
```

There are many useful use cases for "sandwich code". Timing, logging, notification systems are all examples where before/after actions are important.

### Another area where before/after actions are important is in resource management, or interfacing with the operating system. Many OS interfaces require you, the developer, to first allocate a portion of a resource, then perform some clean-up to free up that resource. Forgetting to do the clean-up can result in dramatic bugs -- system crashes, memory leaks, file system corruption. Wouldn't it be great if we can automate this clean-up?

This is exactly what the File::open method does for us. For example, the typical example for opening a file in Ruby is:

```ruby
my_file = File.open("some_file.txt", "w+")          # creates a file called "some_file.txt" with write/read permissions
# write to this file using my_file.write
my_file.close
```

That last line closes the file and releases the my_file object from hanging on to system resources -- specifically, the file "some_file.txt". Since we always want to close files, File::open can also take a block, and will automatically close the file after the block is executed. Using the block syntax, we can do this:
```ruby
File.open("some_file.txt", "w+") do |file|
  # write to this file using file.write
end
```
Why is it that we don't have to close the file? Without understanding how blocks work, it's not obvious what the magic is. But now that you understand how yield works, you can guess that the method implementor of File::open opens the file, yields to the block, then closes the file. This means the method user only needs to pass in the relevant file manipulation code in the block without worrying about closing the file.

##########################################################################################################################################
# *Methods with an explicit block parameter*

The last topic we want to discuss is passing a block to a method explicitly. Until now, we've passed blocks to methods implicitly. Every method, regardless of its definition, takes an implicit block. It may ignore the implicit block, but it still accepts it.

However, there are times when you want a method to take an explicit block; an explicit block is a block that gets treated as a named object -- that is, it gets assigned to a method parameter so that it can be managed like any other object -- it can be reassigned, passed to other methods, and invoked many times. To define an explicit block, you simply add a parameter to the method definition where the name begins with an & character:

```ruby
def test(&block)
  puts "What's &block? #{block}"
end

test { sleep(1) }

# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil
```
The &block is a special parameter that converts the block argument to what we call a "simple" `Proc` object (the exact definition of a simple `Proc` object isn't important at this time). Notice that we drop the `&` when referring to the parameter inside the method.

As you can see, the block local variable is now a Proc object. Note that we can name it whatever we please; it doesn't have to be `block`, just as long as we define it with a leading `&`.


So, what's the point? We were doing fine yielding to an implicit block. Why do we now need an explicit block instead? Chiefly, the answer is that it provides additional flexibility. Before, we didn't have a handle (a variable) for the implicit block, so we couldn't do much with it except yield to it and test whether a block was provided. *Now we have a variable that represents the block, so we can pass the block to another method:*
```ruby
def test2(block)
  puts "hello"
  block.call          # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { |prefix| puts "xyz" }
# => 1
# hello
# xyz
# good-bye
# => 2
```

Note that you only need to use & for the block parameter in #test. Since block is already a Proc object when we call test2, no conversion is needed.

Note that we also use block.call inside test2 to invoke the Proc instead of yield. (If you wanted to invoke the Proc from test, you would do the same thing: block.call.)


You can also pass arguments to the explicit block by using them as arguments to `call`:
```ruby
def display(block)
  block.call(">>>") # Passing the prefix argument to the block
end

def test(&block)
  puts "1"
  display(block)
  puts "2"
end

test { |prefix| puts prefix + "xyz" }
# => 1
# >>>xyz
# => 2
```

*The above discussion of explicit blocks is simplified from reality. Things get a bit more complicated if the user passes in a Proc object, a lambda, or some other object to a method that takes an explicit block. For now, you just need to know that Ruby converts blocks passed in as explicit blocks to a simple Proc object (this is why we need to use #call to invoke the Proc object).*



##########################################################################################################################################
# *Using Closures*

We won't do much with this here in the Ruby courses, but a very powerful capability in Ruby and many other languages is the ability to pass chunks of code -- closures -- around in a program. As described earlier, closures are formed by blocks, Proc objects, and lambdas. They retain a memory of their surrounding scope and can use and even update variables in that scope when they are executed, even if the block, Proc, or lambda is called from somewhere else. For instance:

```ruby
def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end

p results # => [0, 1, 3, 6, 10, 15]
```

Though the block passed to for_each_in is invoked from inside for_each_in, the block still has access to the results array through closure.

Where closures really shine, though, is when a method or block returns a closure. We can't return blocks, but we can return Procs. We'll demonstrate this with Procs; lambdas are very similar, but differ primarily in syntax.

Consider the following code:
```ruby
def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call           # 1
p s1.call           # 2
p s1.call           # 3
puts

s2 = sequence
p s2.call           # 1
p s1.call           # 4 (note: this is s1)
p s2.call           # 2
```

Here, the `#sequence` method returns a Proc that forms a closure with the local variable counter. Subsequently, we can call the returned Proc repeatedly. Each time we do, it increments its own private copy of the counter variable. Thus, it returns 1 on the first call, 2 on the second, and 3 on the third.

Interestingly, we can create multiple Procs from sequence, and each will have its own independent copy of counter. Thus, when we call sequence a second time and assign the return value to s2, the counter associated with s2 is separate and independent of the counter in s1.

##########################################################################################################################################
# *Summary*

- blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later.

- blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about wrong number of arguments passed to it.

- blocks return a value, just like normal methods.

- blocks are a way to defer some implementation decisions to method invocation time. It allows method users to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.

- blocks are a good use case for "sandwich code" scenarios, like closing a File automatically.

- methods and blocks can return a chunk of code by returning a Proc or lambda.