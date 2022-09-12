=begin
Write a method that takes a string as an argument, and returns true if all 
parentheses in the string are properly balanced, false otherwise. 
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
Matching parentheses must start with `(` not `)`

**Problem
Write a method that takes a string as an argument and returns true if the amount
of parentheses match, false otherwise.
-Matching parentheses must start with `(` not `)`

**Examples/Test Cases
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

**Data Structures
Input: String
Output: boolean value

'()' => true
')(' => false
'('  => false

**Algorithm
initialize a variable to an array containing the characters within the string
initialize two variables `start` and `finish` to the count of '(' and ')'
initialize a variable `parentheses` containing only the parentheses
check if the string contains the same amount of `(` and ')'
- if both counts are not equal check return false
- if both counts are `0` (no parentheses in input string) return true
- If `parentheses` does no start with `(` OR end wirg `)` return false
- If the first `(` is located before the first `)` in the array return true
- otherwise return false

=end

def balanced?(str)
    arr = str.chars
    start = arr.count('(')
    finish =  arr.count(')')
    parentheses = arr.keep_if{|char| char == '(' || char == ')'}


    if start != finish
        return false
    elsif start == 0 && finish == 0
        return true
    elsif !parentheses.join.start_with?('(') || !parentheses.join.end_with?(')')
        return false
    elsif parentheses.find_index('(') < parentheses.find_index(')')
        return true
    else 
        return false
    end
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false