# *Refresher*
A block creates a new scope for local variables, and only outer local variables are accessible to inner blocks.

```ruby
level_1 = "outer-most variable"

[1, 2, 3].each do |n|                     # block creates a new scope
  level_2 = "inner variable"

  ['a', 'b', 'c'].each do |n2|            # nested block creates a nested scope
    level_3 = "inner-most variable"

    # all three level_X variables are accessible here
  end

  # level_1 is accessible here
  # level_2 is accessible here
  # level_3 is not accessible here

end

# level_1 is accessible here
# level_2 is not accessible here
# level_3 is not accessible here
```

this is only for local variables; methods don't follow this rule.

local variables initialized outside a method aren't accessible inside a method.

# *Closure and Binding*

A block is how Ruby implements the idea of a closure, which is a general computing concept of a "chunk of code" that you can pass around and execute at some later time. In order for this "chunk of code" to be executed later, it must understand the surrounding context from where it was defined.

In Ruby, this "chunk of code" or closure is represented by a `Proc object, a lambda, or a block`. Let's take a look at an example:

```ruby
def call_me(some_code)
  some_code.call    # call will execute the "chunk of code" that gets passed in
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code)  # hi Robert
                        # => nil
```

Note that the `Proc` identified by some_code knew how to handle puts #{name}, and, specifically, that it knew how to process the name variable. 

We'll use the same code, except we'll re-assign the name variable after the `Proc` has been initialized. Let's see if the chunk of code retains its old value of "Robert" or our new value of "Griffin III".

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code)  # hi Griffin III
                        # => nil
```

The `Proc` is aware of the new value even though the variable was reassigned after the Proc was defined. This implies that the Proc keeps track of its surrounding context, and drags it around wherever the chunk of code is passed to. *In Ruby, we call this its `binding`, or surrounding environment/context*.

A closure must keep track of its binding to have all the information it needs to be executed later. This not only includes local variables, but also method references, constants and other artifacts in your code -- whatever it needs to execute correctly, it will drag all of it around. It's why code like the above works fine, seemingly violating the variable scoping rules we learned earlier. *Note that any local variables that need to be accessed by a closure must be defined **before** the closure is created*, unless the local variable is explicitly passed to the closure when it is called (e.g., some_proc.call(some_variable)). In the code from the last example, removing `name = "Robert"` on line 5 would change the binding of the `Proc` object on line 6: `name` would no longer be in scope since it is initialized only after the `Proc` is instantiated.

Bindings and closures are at the core of variable scoping rules in Ruby. It's why "inner scopes can access outer scopes".