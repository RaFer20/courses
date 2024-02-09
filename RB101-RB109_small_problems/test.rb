my_hash = {a: 1, b: {d: 3, e: 5}, c: 7}

my_hash[:b][:d] # => 3

On line 3 we are using [] to access specific values within a nested array. We are first referencing the value attached to the :b key within my_hash and then the value attached to the :d key within the hash attached to :b.

This example demonstrates the concept of referencing collection elements.