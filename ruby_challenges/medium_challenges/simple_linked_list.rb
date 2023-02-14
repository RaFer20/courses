class Element

  def initialize(value, next_value=nil)
    @value = value
    @next = next_value
  end

  def datum
    @value
  end

  def tail?
    return true if @next.nil?
    false
  end

  def next
    @next
  end
end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(arr)
    arr = [] if arr.nil?
    list = SimpleLinkedList.new
    arr.reverse_each{|elmnt| list.push(elmnt)}
    list
  end

  def to_a
    arr = []
    current_element = @head
    while !current_element.nil?
      arr << current_element.datum
      current_element = current_element.next
    end
    arr
  end

  def push(value)
    element = Element.new(value, @head)
    @head = element
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum

  end

  def size
    size = 0
    current_element = head

    while !current_element.nil?
      size += 1 
      current_element = current_element.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def peek
    @head.datum if @head
  end

  def reverse
    list = SimpleLinkedList.new
    current_element = head

    while !current_element.nil?
      list.push(current_element.datum)
      current_element = current_element.next
    end
    list
  end
end