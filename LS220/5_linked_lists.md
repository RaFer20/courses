# Introduction to Linked Lists
Linked lists are dynamic data structures. They can grow or shrink in size as needed. Adding or removing items in a linked list is easier than in arrays because you don't need to worry about finding contiguous memory blocks or copying data. You can simply rearrange the pointers in the nodes to link them correctly.

A linked list is composed of nodes. The first node in the list is called the head, and it serves as the starting point to access the rest of the list. Each node contains two things: the actual data it holds and a reference (or pointer) to the next node in the list. Think of it as a chain of nodes, where each node holds some data and points to the next node in line. Almost every linked list requires a head, which serves as the primary access point to the list and all its elements. Without a head, determining the starting point becomes impossible. The final node in the list has its next pointer pointing to null, indicating the end of the list rather than another node.

A singly linked list is like a line of people standing in a row, each person facing forward and holding the hand of the person in front. You can only move forward through the line.

A doubly linked list is more like a circle of people holding hands, where each person holds hands with both the person in front and the person behind. This allows you to move in both directions, either clockwise or counterclockwise around the circle.

Finally, a circular linked list is similar to a train on a circular track. Each train car represents a node, and it connects to the next car in a loop. You can start at any car and go around the track endlessly, visiting all the cars.

## Nodes-as-a-class
In this approach, each node of the linked list is represented as an instance of a Node class. The Node class consists of two main components: the data we want to store in the node and a reference to the next node in the list.

By utilizing classes, we can encapsulate the properties and behavior of each node into a single entity, making it a clean and organized way to conceptualize linked lists.

To implement a linked list using the Node-as-a-class approach, we can define a Node class in JavaScript.
```js
class Node {
  constructor(data, next) {
    this.val = data === undefined ? 0 : data;
    this.next = next === undefined ? null : next;
  }
}
```

## Comparing Linked Lists and Arrays
### Reading
While arrays enable direct access to any element in constant time O(1), reading from a linked list involves a distinct process. Imagine we want to retrieve the value of the fourth item in a linked list. Unlike arrays, where elements reside consecutively in memory, the nodes of a linked list can be scattered throughout memory.

To access the fourth node, the computer undertakes a step-by-step journey. It starts by accessing the first node and then follows the link within that node to reach the second node. Subsequently, it continues by traversing the link in the second node, then the third, to finally arrive at the fourth node. Thus, reaching any desired node within a linked list requires starting with the head node and following the chain of nodes until reaching the intended node.

In the worst-case scenario, when reading from the last node, the process requires N steps, where N denotes the total number of nodes in the list. This insight unveils a notable drawback of linked lists: their read efficiency becomes `O(N)`, a substantial contrast to arrays that provide constant-time access to any element `O(1)`.

### Searching
Both arrays and linked lists have a linear time complexity `O(N)` for searching elements. In a linked list, we need to follow the links from the first node until we find the desired value. Similar to reading, the worst-case scenario for searching in a linked list occurs when we have to traverse all the nodes. Likewise, searching an array requires examining each element in turn until we find the desired element.

### Insterting
Unlike arrays, where inserting at index 0 requires shifting all subsequent elements, linked lists can effortlessly insert data at the front of the list in just one step, resulting in a constant time complexity of O(1). This is where linked lists truly shine. Regardless of the size of the linked list, inserting at the beginning always takes the same amount of time.

In the worst-case scenario, inserting at the end of the linked list requires traversing the entire list to reach the last node, resulting in a time complexity of O(N), where N represents the number of nodes in the list. *It is also worth noting that the worst-case scenario for linked lists, which involves appending elements, is the best-case scenario for arrays, and vice versa.*

### Deleting
Similar to insertion, linked lists outperform arrays in deletion operations, especially when removing elements from the beginning of the list. Deleting the first node in a linked list only involves updating the reference to the first node, resulting in constant time complexity `O(1)`.

In contrast, deleting the first element of an array requires shifting all remaining elements one cell to the left, resulting in a time complexity of `O(N)`. This is a notable disparity when compared to the efficiency of linked lists.

When it comes to deleting the final node of a linked list, the deletion itself requires only one step. We can accomplish this by modifying the link of the second-to-last node, making it null. However, accessing the second-to-last node requires traversing N steps since we must start at the beginning of the list and follow the links until we reach it, resulting in a worst-case time complexity of `O(N)`.

## Practice Problem - Remove Elements from a Linked List

```js
// Given a head of a linked list and a target value,
// remove all occurrences of the target value from the
// linked list.

// Input: 1 -> 2 -> 3 -> 2 -> 4 -> null, Target: 2
// Output: 1 -> 3 -> 4

// Input: 1 -> 3 -> 1, Target: 1
// Output: 3 -> null

// Input: null, Target: 3
// Output: null
class Node {
  constructor(data, next) {
    this.val = data === undefined ? 0 : data;
    this.next = next === undefined ? null : next;
  }
}

function deleteFromLinkedList(head, target) {
  let prev = null;
  let curr = head;

  if (!head) {
    return head;
  }

  while (curr) {
    if (curr.val === target) {
      if (!prev) {
        head = curr.next;
      } else {
        prev.next = curr.next;
      }
    } else {
      prev = curr;
    }
    curr = curr.next;
  }

  return head;
}

// Helper function to print the linked list
function printList(head) {
  let curr = head;
  let result = "";
  while (curr !== null) {
    result += curr.val + " -> ";
    curr = curr.next;
  }
  result += "null";
  return result;
}

// Test case 1
const head1 = new Node(1);
head1.next = new Node(2);
head1.next.next = new Node(3);
head1.next.next.next = new Node(2);
head1.next.next.next.next = new Node(4);

console.log("Input: 1 -> 2 -> 3 -> 2 -> 4 -> null");
console.log("Target: 2");
console.log("Output:", printList(deleteFromLinkedList(head1, 2)));
// Output: 1 -> 3 -> 4

// Test case 2
const head2 = new Node(1);
head2.next = new Node(3);
head2.next.next = new Node(1);

console.log("Input: 1 -> 3 -> 1");
console.log("Target: 1");
console.log("Output:", printList(deleteFromLinkedList(head2, 1)));
// Output: 3 -> null
```

## Dummy Nodes
Dummy nodes are fictitious or temporary nodes that are inserted into a data structure or algorithm to assist in handling special cases or simplifying complex scenarios.

By using a dummy node, we can ensure that its next pointer always points to the head node, eliminating the need to handle certain edge cases where the head node changes or is removed from the list.

### Remove Elements from a Linked List using a Dummy Node
```js
// Given a head of a linked list and a target value,
// remove all occurrences of the target value from the
// linked list.

// Input: 1 -> 2 -> 3 -> 2 -> 4 -> null, Target: 2
// Output: 1 -> 3 -> 4

// Input: 1 -> 3 -> 1, Target: 1
// Output: 3 -> null

// Input: null, Target: 3
// Output: null
function removeElements(head, target) {
  let dummy = new Node();
  dummy.next = head;
  let prev = dummy;
  let curr = head;

  while (curr) {
    if (curr.val === target) {
      prev.next = curr.next;
    } else {
      prev = curr;
    }
    curr = curr.next;
  }

  return dummy.next;
}
```

## Another Practice Problem - Reverse Linked List
```js
// Given the head of a linked list, reverse the list and return it.

// Input: 1 -> 2 -> 3 -> 4 -> null
// Output: 4 -> 3 -> 2 -> 1 -> null
class Node {
  constructor(data, next) {
    this.val = data === undefined ? 0 : data;
    this.next = next === undefined ? null : next;
  }
}

function reverseLinkedList(head) {
  if (!head) {
    return null;
  }

  let prev = null;
  let curr = head;

  while (curr !== null) {
    let next = curr.next;
    curr.next = prev;
    prev = curr;
    curr = next;
  }
  return prev;
}

// Helper function to print the linked list
function printList(head) {
  let curr = head;
  let result = "";
  while (curr !== null) {
    result += curr.val + " -> ";
    curr = curr.next;
  }
  result += "null";
  return result;
}

// Test case 1
const head1 = new Node(1);
head1.next = new Node(2);
head1.next.next = new Node(3);
head1.next.next.next = new Node(4);

console.log("Input: 1 -> 2 -> 3 -> 4 -> null");
console.log("Output:", printList(reverseLinkedList(head1)));
// Output: 4 -> 3 -> 2 -> 1 -> null
```