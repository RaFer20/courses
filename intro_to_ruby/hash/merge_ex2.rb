# merge_ex2.rb

#the difference between merge and merge! is that merge! modifies
# the original and merge does not.

person = {name: "bob"}
age = {age: "21"}

person.merge(age)
p person
p age
# the original wasnt modified
p person.merge!(age)
p person
p age
# person was permanently modified the the merge! method
