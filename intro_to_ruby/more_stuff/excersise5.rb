def execute(block) # no & sign so the block can't be passed as a parameter
  block.call
end

execute { puts "Hello from inside the execute method!" }