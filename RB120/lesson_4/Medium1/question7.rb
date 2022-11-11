# How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

######################################
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status # remove `light` to make it less repetitive and not have to call `light_instance.light_status`
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end
