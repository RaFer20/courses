=begin
Complete this program so that it produces the expected output:
class Book
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

Expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

class Book
  attr_reader :title, :author
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

## Further Exploration
=begin
What are the differences between attr_reader, attr_writer, and attr_accessor? 
Why did we use attr_reader instead of one of the other two? Would it be okay to use one of the others? 
Why or why not?
attr_reader will only allow us to retrieve the value in the instance variable, but not set it
attr_writer will only let us set the instance variable's value
attr_accessor will allow us to do both.

In this example we could have used `attr_accessor` too but there was no reason to do so since we aren't setting the instance variable
to anything other than while initializing them.

Instead of attr_reader, suppose you had added the following methods to this class:
  def title
    @title
  end

  def author
    @author
  end

Would this change the behavior of the class in any way? If so, how? If not, why not?
  no, it's a getter method either way.

Can you think of any advantages of this code?
  you could add extra functionality to the getter method. 
  For example instead of just returning the @title instance variable itself, we could add a sentence to it and interpolate the title.

=end