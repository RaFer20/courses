In this assignment, we're going to create a TodoList which contains a collection of Todo objects. Internally to TodoList, we'll use an Array to back the collection of Todo objects.

We'll first take a look at the Todo class.

```ruby
# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end
```

The above is a simple `Todo` class that contains 3 attributes each `Todo` object can have: a title, a description, and a boolean flag to designate whether the todo item is "done". We have 3 helper methods to set, unset, and interrogate the `@done` attribute; these aren't strictly necessary, but give a better interface when working with `Todo` objects. Finally, we provide a `to_s` method for representing `Todo` objects as strings, and an `==` method that lets us compare two `Todo` objects for equality. We can use this class in our `TodoList` class below to encapsulate todo items.

Examples with `Todo` class:
```ruby
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

puts todo1
puts todo2
puts todo3

# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym
```

The puts methods automatically calls the argument's `to_s` method, which in this case leads to the `Todo#to_s` method. The return value of any `puts` call is `nil`. Let's say we bought some milk, so we want to update the todos.

```ruby
todo1.done!

puts todo1
puts todo2
puts todo3

# [X] Buy milk
# [ ] Clean room
# [ ] Go to gym
```

Pretty neat! There's not too much beyond this functionality for `Todo` objects. We create them, we can mark them done or undone, then we can display them.

Let's now turn our attention to the collection class, `TodoList`. Why build our own? Can't we just use an `Array` and work with an array of `Todo` objects? We could, but using our own custom collection class allows us to add additional attributes to the collection, and also allows us to add additional behaviors specific to todo lists. For example, our collection of Todo objects should have a title, or perhaps a due date. Using `Array` doesn't allow us to add these collection level attributes. We could also append two TodoList objects together to get a new TodoList, but we can't do that with `Array` (we'd get a new `Array`). We could further define specific requirements about what types of objects this list should have. For example, our TodoList should only work with Todo objects, and using our own custom collection class, we can enforce this requirement. We can't use an `Array`. Sometimes, using Ruby's basic collections is enough, other times we need something more.

Take a look at the initial implementation of the `TodoList` class below. Note that we are using `Array` as the backing mechanism internally to keep track of our Todo objects. We can easily change it to a hash or linked list or whatever in the future, as long as our TodoList public interface (ie, public methods) doesn't change.

```ruby

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

end
```

The assignment for you is to figure out the rest of the implementation in order for the below code to work. Note that this assignment doesn't have anything to do with blocks yet -- it's just basic Ruby at this point.

Implement the rest of the TodoList so that we can write this code:

```ruby

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

#to_a
list.to_a                      # returns an array of all items in the list

#done?
list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
list.mark_done_at(100)          # raises IndexError

# mark_undone_at
list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
list.shift                      # removes and returns the first item in list

# pop
list.pop                        # removes and returns the last item in list

# remove_at
list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
```

Study the requirements above, and try to build the TodoList class.

**see assignment_todolist.rb**