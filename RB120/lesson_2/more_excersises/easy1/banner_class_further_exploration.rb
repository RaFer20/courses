=begin
Further Exploration
Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created.
The message in the banner should be centered within the banner of that width.
Decide for yourself how you want to handle widths that are either too narrow or too wide.
=end
class Banner
  attr_reader :width
  def initialize(message, width=(message.length+4), height=5)
    @message = message
    @width = width
    @height = height # must be an odd number to be centered vertically
  end
  
  def to_s
    return error_message if width < (@message.length+4)
    create_banner
  end
  private

  def create_banner
    banner_array = []
    (@height-3).times{ banner_array << empty_line}
    banner_array.prepend(horizontal_rule)
    banner_array.append(horizontal_rule)
    banner_array.insert(banner_array.length/2, message_line)
    banner_array.join("\n")
  end

  def horizontal_rule
    "+-" + '-'*(message_line.length-4) + "-+"
  end

  def empty_line
    "| " + " "*(message_line.length-4)  + " |"
  end

  def message_line
    spaces_to_insert = ((@width-@message.length)-4)/2 # 4 is the reserved spaces for the characters at the start and end of the banner
    "| " + " "*spaces_to_insert + "#{@message}" + " "*spaces_to_insert + " |"
  end

  def error_message
    puts "Width must be at least 4 spaces longer than the length of the input message"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

test_banner = Banner.new("Test message", 60, 21)
puts test_banner