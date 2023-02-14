class Robot
  @@used_names = []

  def name
    if @name
      @name
    else
      loop do
        @name = generate_name
        break if !@@used_names.include?(@name)
      end
      @@used_names << @name
      @name
    end
  end

  def reset
    @@used_names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    (("A".."Z").to_a.shuffle[0,2] + (0..9).to_a.shuffle[0,3]).join
  end
end