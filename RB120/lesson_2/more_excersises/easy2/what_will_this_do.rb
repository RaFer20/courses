=begin
What will the following code print?
class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata
=end

#The first `puts` will output "ByeBye", because it's calling the class method `dupdata`
#The second `puts` will output "HelloHello", because it's calling the instance method `dupdata`
