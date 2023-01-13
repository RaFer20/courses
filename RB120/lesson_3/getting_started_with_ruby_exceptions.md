## Exception Class Hierarchy
Exception
  NoMemoryError
  ScriptError
    LoadError
    NotImplementedError
    SyntaxError
  SecurityError
  SignalException
    Interrupt
  StandardError
    ArgumentError
      UncaughtThrowError
    EncodingError
    FiberError
    IOError
      EOFError
    IndexError
      KeyError
      StopIteration
    LocalJumpError
    NameError
      NoMethodError
    RangeError
      FloatDomainError
    RegexpError
    RuntimeError
    SystemCallError
      Errno::*
    ThreadError
    TypeError
    ZeroDivisionError
  SystemExit
  SystemStackError
  fatal

## When should you handle an exception?
Some exceptions are more serious than others; there are some errors that we should allow to crash our program. Important errors such as NoMemoryError, SyntaxError, and LoadError must be addressed in order for our program to operate appropriately.

In order to avoid causing unwanted behaviors yourself, it is important to be intentional and very specific about which exceptions you want to handle and what action you want to take when you handle them. The action you choose to take when handling an exception will be dependent on the circumstances; examples include logging the error, sending an e-mail to an administrator, or displaying a message to the user.


## The begin/rescue Block

Using a begin/rescue block to handle errors can keep your program from crashing if the exception you have specified is raised. 
It is possible to include multiple rescue clauses to handle different types of exceptions that may occur.

begin
  # some code at risk of failing
rescue TypeError
  # take action
rescue ArgumentError
  # take a different action
end

Or if you want to take the same action for more than one exception:
begin
  # some code at risk of failing
rescue ZeroDivisionError, TypeError
  # take action
end


## Exception Objects and Built-in Methods

Some useful instance methods that Ruby provides are Exception#message and Exception#backtrace, which return an error message and a backtrace associated with the exception, respectively.

begin
  # code at risk of failing here
rescue StandardError => e   # storing the exception object in e
  puts e.message            # output error message
end

We can even call Object#class on an exception object to return its class name.
e.class
#=> TypeError



You may also choose to include an ensure clause in your begin/rescue block after the last rescue clause. This branch will always execute, whether an exception was raised or not.

file = open(file_name, 'w')
begin
  # do something with file
rescue
  # handle exception
rescue
  # handle a different exception
ensure
  file.close
  # executes every time
end
Whether or not an exception was raised when working with the file, this code ensures that it will always be closed.

One important thing to remember about ensure is that it is critical that this code does not raise an exception itself. If the code within the ensure clause raises an exception, any exception raised earlier in the execution of the begin/rescue block will be masked and debugging can become very difficult.



Using retry in your begin/rescue block redirects your program back to the begin statement. This allows your program to make another attempt to execute the code that raised an exception.
You may find retry useful when connecting to a remote server, for example.

RETRY_LIMIT = 5
begin
  attempts = attempts || 0
  # do something
rescue
  attempts += 1
  retry if attempts < RETRY_LIMIT
end
retry must be called within the rescue block, as seen below on line 8. Using retry elsewhere will raise a SyntaxError.



## Raising Exceptions Manually

Ruby actually gives you the power to manually raise exceptions yourself by calling Kernel#raise. This allows you to choose what type of exception to raise and even set your own error message. If you do not specify what type of exception to raise, Ruby will default to RuntimeError (a subclass of StandardError). 

There are a few syntax options to use when working with raise:
raise TypeError.new("Something went wrong!")
raise TypeError, "Something went wrong!"

In the following example, the exception type will default to a RuntimeError, because none other is specified. The error message specified is "invalid age".
def validate_age(age)
  raise("invalid age") unless (0..105).include?(age)
end

Exceptions you raise manually in your program can be handled in the same manner as exceptions Ruby raises automatically.
begin
  validate_age(age)
rescue RuntimeError => e
  puts e.message              #=> "invalid age"
end



## Raising Custom Exceptions

In addition to providing many built-in exception classes, Ruby allows us the flexibility to create our own custom exception classes.

class ValidateAgeError < StandardError; end

When using a custom exception class, you can be specific about the error your program encountered by giving the class a very descriptive name. Doing so may aid in debugging.

def validate_age(age)
  raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
end
begin
  validate_age(age)
rescue ValidateAgeError => e
  # take action
end

