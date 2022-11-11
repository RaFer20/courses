# You are given the following code:
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:
oracle = Oracle.new
oracle.predict_the_future

##
# an `Oracle` object will be instantiated in the first line, the second line calls the `predict_the_future` method on `oracle`
# The string "You will " will be concatenated with one of the strings in the array on the array the `choices` method returns 