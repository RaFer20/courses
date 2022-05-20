# The main difference between dup and clone is that clone preserves the frozen state of the object.

arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array

# dup doesn't preserve the frozen state of the object.
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]

# What is freezing? In Ruby, objects can be frozen in order to prevent them from being modified.
str = "abc".freeze
str << "d"
# => RuntimeError: can't modify frozen String

5.frozen? # => true

# freeze only freezes the object it's called on. If the object it's called on contains other objects, those objects won't be frozen.
# For example, if we have a nested array the nested objects can still be modified after calling freeze.
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]

# This also applies to strings within an array.
arr = ["a", "b", "c"].freeze
arr[2] << "d"
arr # => ["a", "b", "cd"]