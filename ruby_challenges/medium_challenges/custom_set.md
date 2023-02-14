Create a custom set type.

Sometimes it is necessary to define a custom data structure of some type, like a set. In this exercise you will define your own set type. How it works internally doesn't matter, as long as it behaves like a set of unique elements that can be manipulated in several well defined ways.

In some languages, including Ruby and JavaScript, there is a built-in Set type. For this problem, you're expected to implement your own custom set type. Once you've reached a solution, feel free to play around with using the built-in implementation of Set.

For simplicity, you may assume that all elements of a set must be numbers.

# **Problem**
For our program, the details we need to keep in mind are as follows:

A set only allows for unique values.
Values in a set can be stored in any order.
All values must be numbers.
The problem description doesn't give us much detail about how our custom set should behave. We can look at the test cases for more information.

Sets don't have to be in any particular order.

The constructor takes an array as an argument, and uses the contents of that argument as the elements of the set. If the array contains duplicate values, only one instance of the value should be stored in the set.

# **Examples**
The test cases indicate that we need to write several instance methods for a class, CustomSet. We should be able to add elements to a set using the instance method add.

There are also some important terms to note:

A set, A, is a subset of another set, B, if all of the elements in A are also in set B.

{ 1, 2, 3 } is a subset of { 2, 4, 3, 1 }
{ 1, 2, 3 } is not a subset of { 1, 2 }
{ 1, 2, 3 } is not a subset of { 1, 2, 4, 5 }
Two sets, A and B, are said to be disjoint if none of the elements in set A are in set B. That also implies that none of the elements in B are in A.

{ 1, 2, 3 } and { 4, 5, 6 } are disjoint sets.
{ 1, 2, 3 } and { 4, 3, 6 } are not disjoint
Two sets are said to be equal if both sets contain the exact same elements.

{ 1, 2, 3 } and { 1, 2, 3 } are equal sets.
{ 1, 2, 3 } and { 3, 1, 2 } are also equal sets - the order does not matter.
{ 1, 2, 3 } and { 1, 2 } are not equal sets.
The intersection of two sets, A and B, is a new set that contains all of the elements that are in both A and B. That is, the intersection contains all of the shared elements.

The intersection of { 1, 2, 3 } and { 1, 3, 5 } is { 1, 3 }.
The intersection of { 1, 2, 3 } and { 4, 5, 6 } is the empty set: { }.
The union of two sets, A and B, is a new set that contains all of the elements that are in either A and B (and perhaps both).

The union of { 1, 2, 3 } and { 1, 3, 5 } is { 1, 2, 3, 4, 5 }.
The difference of two sets, A and B, is a new set that contains all of the elements of A that are not present in B.

The difference of { 1, 2, 3 } and { 1, 3, 5 } is { 2 }.
The difference of { 1, 5, 7 } and { 1, 2, 3 } is { 5, 7 }.
The difference of { 1, 2, 3 } and { 4, 5, 6 } is { 1, 2, 3 }.
The methods we need for our CustomSet revolve around the above terms:

a constructor method.
a method to return the intersection of the current set with another.
a method to return the union of the current set with another.
a method to return the difference between the current set and another.
a method that determines whether the current set and another are disjoint.
a method that determines whether the current set and another are equal.
a method that determines whether the current set is a subset of another.
a method that adds a new element to the current set.
a method that determines whether the current set contains a specific value.
a method that determines whether the current set is empty.
We may also want to create some helper methods to assist us, but those are optional.

# **Data Structures**
There are two major data structures we might want to consider for our custom sets -- arrays and dictionaries.

It's possible that you've never heard of the term dictionary when talking about structures. That's okay - the term is just a generic way of referring to something that you're already familiar with, but by a different name. Depending on the languages you're familiar with, they are known as hashes, associative arrays, mappings, or just ordinary objects. For instance:

In Ruby, hashes play the role of dictionaries.
In JavaScript, plain objects play the role of dictionaries.
In short, a dictionary is a data structure that allows values to be stored and retrieved as key/value pairs. It's a lot like an English language dictionary: the words listed are keys, and the definitions are values.

For most set types, dictionaries seem like a good choice at first glance. You just create a dictionary that uses the element values as keys and the value associated with each pair can be anything (usually something like nil, null, or 0). This works great in languages like Ruby where a hash key can be any value, but it fails in JavaScript where object keys are always treated as strings. In this program, dictionaries are acceptable, even in JavaScript -- the number values will be coerced to strings.

Arrays are also a good choice, though the implementation of an array-based set is a little more complex. In particular, you have to search the array sequentially every time you want to determine whether the set contains a specific element. With large sets, that sequential search can also result in performance issues. Despite the complexity and performance issues, we will use an array in our solutions. (Later, if you want, you can rework your solution to use a dictionary.)

# **Algorithm**

*constructor*

If the argument was omitted, default to an empty array.
Initialize the instance's internal array to the unique elements from the argument array.

*Method: is this set empty? (Ruby: empty?; JavaScript: isEmpty)*

Return true if the internal array's length is 0.
Return false otherwise.

*Method: intersection*

Find all elements from this set that are also present in the other set.
Use the found elements to create a new set
Return the new set.

*Method: union*

Create a duplicate set from the current set to use as the result.
Add all of the elements from the other set to the result set
Return the result set.

*Method: difference*

Find all elements from this set that are not present in the set passed as an argument.
Use the found elements to create a new set
Return the new set.

*Method: are sets disjoint? (Ruby: disjoint?; JavaScript: isDisjoint)*

Are any of the elements in the current set present in the other set?
Yes: return false
No: return true

*Method: are sets identical? (Ruby: eql?; JavaScript: isSame)*

Return false if the two sets have different sizes
Are any of the elements in the current set missing in the other set?
Yes: return false
No: return true

*Method: is subset? (Ruby: subset?; JavaScript: isSubset)*

Are all of the elements in the current set present in the other set?
Yes: return true
No: return false

*Method: add*

Is element currently in set array?
No. Push the element onto the set array.
Return current set.

*Method: is element in set? (Ruby: contains?; JavaScript: contains)*

Does set array contains element?
Yes. Return true.
No. Return false.

*Method: ==*

Call eql? method.