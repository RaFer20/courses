3. Draw a class hierarchy diagram of the classes from step #2

                     Pet 
                 (run, jump)

        Dog                  Cat
(speak, fetch, swim)        (speak)

      Bulldog
      (swim)

4. What is the method lookup path and how is it important?

It's the order in which Ruby looks for the method while traversing the class hierarchy, 
it allows us to see where the method comes from (if found) and will
use the first instance found of any method that appears at multiple levels

All classes are subclasses of `Object`