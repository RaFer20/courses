# excersise1.rb

def has_lab?(string)
  if string =~ /lab/
    puts "Match!"
  else 
    puts "No Match here."
  end
end

has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("polar bear")