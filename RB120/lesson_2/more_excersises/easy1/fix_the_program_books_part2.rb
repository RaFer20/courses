=begin
Complete this program so that it produces the expected output:
class Book
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

Expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end
class Book
  attr_accessor :author, :title
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

## Further Exploration
=begin
What do you think of this way of creating and initializing Book objects? (The two steps are separate.) 
Would it be better to create and initialize at the same time like in the previous exercise? 
  There's advantages to doing it this way in that it allows us to modify the instance variables after creating the book ojects

What potential problems, if any, are introduced by separating the steps?
  We are allowing the instance variable to be modified and be visible publicly outside the class 
=end