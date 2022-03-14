# countdown0.rb

def countdown0(n)
  if n <= 0
    puts n
  else
    puts n
    countdown0(n-1)
  end
end

countdown0(30)