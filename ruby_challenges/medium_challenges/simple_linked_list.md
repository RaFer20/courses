Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide methods to reverse the linked list and convert a linked list to and from an array.

# **Problem**
For our program, the details we need to keep in mind are as follows:

We'll be making a singly linked list. This means that each element in the list does not need to have information about any other element in the list except for the next element.
Each element in the list contains data (a value) and a next field that points to the next element in the list of elements.
The elements of our linked list may contain any data values.
We'll need a method that reverses a linked list, as well as methods that convert a linked list to and from an array.
We may need to also write several helper methods.

The second argument for the Element constructor is optional. Use some sort of default value when the argument is omitted that can't possibly be seen as a valid next element.

The method used to create an array from a linked list should not mutate the linked list used to call it.

The method used to reverse a linked list should not mutate the linked list used to call it. Instead, it should return a new linked list.

# **Examples**
From the test cases shown above, we can see that we need to create two classes: Element and SimpleLinkedList.

*The Element class should have several methods as follows:*

a constructor that expects at least one argument. The first argument is the data value to be stored in the newly created element. The second optional argument is another Element object that will be the next element after the newly created element. If it seems odd to you that the more recently created element would be placed before the already-existing element, remember that our linked list is meant to resemble a push-down/pop-off stack. With such stacks, the most recently added (pushed) elements are the ones that get removed (popped) first. They are commonly known as LIFO stacks: Last In, First Out.

a method that returns the data value of the Element.

a method that returns a boolean that indicates whether the current element is the tail of the list: the last one in the list. The tail element does not have another Element instance stored in the next field.

a method that returns the next Element in the linked list. If the current element is the tail, we should return a value indicating the absence of a next element (e.g., null or nil).

*The SimpleLinkedList class should have several methods as follows:*

a class or static method that creates a new SimpleLinkedList instance from a given array argument.

a class or static method that converts a SimpleLinkedList instance into an array. The datum from each link in our list should be an element in the returned array.

a method that adds its argument to the list.

a method that removes the head of the list (the most recently added item on the list).

a method that returns the Element at the head of the list.

a method that returns the size of the list.

a method that returns a boolean based on whether or not the list is empty.

a method that returns the data value of the head element.

a method that returns the list but in reverse order.

We may also want to create some helper methods to assist us, but those are optional.

# **Data Structures**
The data values in a list can be any sort of value. Each Element object encapsulates a value, regardless of its type.

# **Algorithm**

## **Element**

*constructor*

Save the first argument as the new Element's datum
Save the second argument as the next Element
If the second argument is omitted, use an appropriate default value.

*Method: datum*

Return the Element's value.

*Method: Is this element the tail? (Ruby: tail?; JavaScript: isTail)*

If this Element doesn't have a next Element, return true.
Otherwise, return false.

*Method: next*

Return the next Element (an Element object).

## **SimpleLinkedList**

*constructor*

Set the object's head property/instance variable to an initial value that indicates an empty list.

*Class/Static Method: convert array to linked list (Ruby: from_a; JavaScript: fromArray)*

If array argument is omitted, use an empty array.
Create a new instance of the SimpleLinkedList.
For each element in the array, push the element's value to the new linked list.
Return the new linked list.

*Method: convert linked list to array (Ruby: to_a; JavaScript: toArray)*

Create an empty array for the result.
Set current element to head Element
While the current element is a valid Element
Append datum value of current element to result array
Reassign the current element variable to the next Element.
Return the result array.

*Method: push*

Create a new Element object with the value and next Element passed to push as its two arguments.
Save the new Element object to the list as its new head Element.

*Method: pop*

Save the current head Element temporarily.
Set the linked list's head Element to the value of the old head Element's next property/instance variable.
Return the datum value of the old head Element.

*Method: head*

Return the first Element in the list.
If the list is empty, return an appropriate value that indicates this.

*Method: size*

Set size to 0
Set current element to head Element
While the current element is a valid Element
Increment size by 1
Reassign the current element variable to the next Element.
Return the size

*Method: is the list empty? (Ruby: empty?; JavaScript: isEmpty)*

Return false if the head of the list is a valid Element.
Return true otherwise

*Method: peek*

Returns the datum value of the Element at the head of the list. If the list is empty, return a value that indicates this.

*Method: reverse*

Create a new empty linked list for the result.
Set current element to head Element
While the current element is a valid Element
Create a new Element object using the datum of the current Element.
Push the new Element object to the result list.
Reassign the current element variable to the next Element.
Return the result list.