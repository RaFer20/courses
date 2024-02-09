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

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects!" unless todo.instance_of? Todo
    @todos << todo
  end

  alias << add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all?{|todo| todo.done?}
  end

  def item_at(idx)
    raise IndexError if idx >= @todos.size
    @todos[idx]
  end

  def mark_done_at(idx)
    raise IndexError if idx >= @todos.size
    @todos[idx].done!
  end

  def mark_undone_at(idx)
    raise IndexError if idx >= @todos.size
    @todos[idx].undone!
  end

  def done!
    @todos.each{|todo| todo.done!}
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    raise IndexError if idx >= @todos.size
    @todos.slice(idx)
  end

  def to_s
    <<~MSG
    ----#{title}----
    #{@todos.map(&:to_s).join("\n")}
    MSG

  end

  def [](idx)
    @todos[idx]
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    self
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end