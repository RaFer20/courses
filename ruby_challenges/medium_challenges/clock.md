Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given Clock object. Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

# **Problem**
For our program, the details we need to keep in mind are as follows:

Our clock objects should track hours and minutes.
We should be able to add minutes to and subtract minutes from our clock objects.
If two clock objects have the same time (both hour and minutes), they should be considered equal.
We may want our clock object to use 24-hour notation rather than 12-hour notation since we only need to track hours and minutes, not the date.

The at class/static method can create a new Clock instance using the Clock constructor. Use a default value of 0 for the minutes if the minute argument is omitted from the call to at.

You will need to override the + and - methods in the Clock class. Both operators take a Clock object operand on the left side of the operator, and a number of minutes to the right.

You need to override the == method in the Clock class so that assert_equal and refute_equal work properly.

You also need to override the to_s method to format the time represented by a Clock object as XX:XX.

# **Examples**
From the test cases shown above, we can see that we need to create a Clock class. The class should have several methods as follows:

a constructor that accepts two number arguments representing the hour and minutes.
a class or static method named at that can create and return a new instance of Clock. If the minutes argument is omitted, a default value of 0 will be used.
a method that returns the clock's current time as a string.
methods that add and subtract from the current time. These methods accept a number of minutes to add or subtract as an argument.
a method that compares two clock objects for equality.
We may also want to create some helper methods to assist us, but those are optional.

# **Data Structures**
The hours and minutes will be represented with numbers, and we will be working with numbers each time we add or subtract from the time.

The method that returns the clock's current time as a string must convert the hour and minutes to a string that is formatted properly: XX:XX.

# **Algorithm**
*constructor*

Save the hours and minutes.
There is no need to validate the arguments.

*Static/Class Method: at*

Use a default value of 0 for the minutes if the 2nd argument is omitted.
Call constructor to create a new object.
Return the new object.

*Method: Add Minutes to Clock (Ruby: +; JavaScript: add)*

Compute minutes since midnight for Clock object: use helper method "compute minutes since midnight".
Add minutes argument to minutes since midnight.
While (minutes since midnight >= 24 * 60)
Subtract 24 * 60 from minutes since midnight
Determine time represented by minutes since midnight: use helper method "compute time from minutes since midnight"
Return value returned by previous step.

*Method: Subtract Minutes from Clock (Ruby: -; JavaScript: subtract)*

Compute minutes since midnight for Clock object: use helper method "compute minutes since midnight".
Subtract minutes argument from minutes since midnight.
While (minutes since midnight < 0)
Add 24 * 60 from minutes since midnight
Determine time represented by minutes since midnight: use helper method "compute time from minutes since midnight"
Return value returned by previous step.

*Method: Determine Equality for two Clock Objects (Ruby: ==; JavaScript: isEqual)*

If both Clock objects have the same hours and minutes values, return true
Otherwise, return false.

*Method: Return string representation of Clock object (Ruby: to_s; JavaScript: toString)*

Format hours and minutes as HH:MM where HH and MM are both two digit numbers. If necessary, they should have leading zeros.

*Helper method: compute minutes since midnight*

Return 60 * hours + minutes where hours and minutes are from the current Clock object.

*Helper method: compute time from minutes since midnight*

One argument: minutes since midnight.
See hints for the language of your choice.
Return a new Clock object representing the computed time.