=begin
Use the objects created in the setup method in each of the tests that you're going to write.
For most of the tests that you'll write, that should be all you need. If you do need some other objects,
feel free to create them in the test. Most tests will contain 1 assertion, but you can create more assertions if you feel it's necessary.

In the practice problems below, some of the problems will only list the method name.
You are to write a test to verify the behavior of this method.
=end
require 'simplecov'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!


SimpleCov.start

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_typeerror
    assert_raises(TypeError) { @list.add("Hello") }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shovel
    todo4 = Todo.new("Study")
    @list.add(todo4)
    @todos << todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    todo5 = Todo.new("Make food")
    @list.add(todo5)
    @todos << todo5
  
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError){@list.item_at(15)}
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(50) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_done_at(50) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(80) }
    @list.remove_at(2)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s #squiggly heredoc removes preceding spaces
    output = <<~OUTPUT.chomp 
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp 
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    @todo2.done!
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT.chomp 
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    array = []
    @list.each{|todo| array << todo}
    assert_equal([@todo1, @todo2, @todo3], array)
  end

  def test_each_2
    assert_equal(@list, @list.each{|todo| nil})
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list << @todo1
    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end

  def test_all_done
    @todo1.done!
    list = TodoList.new(@list.title)
    list << @todo1
    assert_equal(list.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    @todo1.done!
    list = TodoList.new(@list.title)
    list << @todo2
    list << @todo3
    assert_equal(list.to_s, @list.all_not_done.to_s)
  end
end
