# **Variables**
**
You can declare variables simply by naming them, and assign values using the = operator.
```bash
name='Sara'
```
*Note the lack of spaces on either side of the = operator.*

To reference a variable, you need to prepend the variable name with the $ sign.
```bash
$name
```
We can pass variables as arguments to bash commands.
```bash
$ echo $name
Sara          # the value we assigned to the name variable is output.
```
If you pass multiple variables to read and input a string with multiple words, one variable will be assigned to each word in the string (split on whitespace) until the last variable which is assigned to all the remaining words. If there are more variables than words, excess variable names will be set to an empty string.
```sh
$ read first second third
Do you like apples?
$ echo $first # Do
$ echo $second # you
$ echo $third # like apples?
```

# **Bash Files**
To run a bash file, we can execute the bash command and pass it the file as an argument:
```bash
$ bash hello_world.sh
```

The `#!` character sequence is known as the shebang, and it is followed by the path to the file or program that should be used to run the subsequent code in the bash file. 
```sh
#!/bin/bash

echo 'Hello world!'
```
In this case we are saying that we want to use the program at /bin/bash to run the code.


If we want to change permissions on the file:
```sh
$ chmod +x hello_world.sh
```
The `+` indicates that we are adding a permission, and the `x` specifies that the permission is `execute`. If we try running the file now it should run without any issues.


# **Conditional Statements**

An if statement opens with the if command, and ends with fi (which is if backwards). It uses the following basic syntax:
```bash
if [[ <condition> ]]
then
  <commands>
fi
```

The condition to be evaluated is enclosed in square brackets, with a space between the condition and the bracket. If you are using a `boolean` instead of evaluating a condition, you can omit the brackets and pass the boolean straight to the if command.

```bash
if true
then
  echo 'True'
fi
```

The brackets are actually a shorthand syntax for running the test command. The test command provides operators for working with strings, integers, and files, among other things. A selection of operators are described below.

*Strings*
Operator	                      Description
-n string	                      Length of string is greater than 0
-z string	                      Length of string is 0 (string is an empty string)
string_1 = string_2	            string_1 is equal to string_2
string_1 != string_2	          string_1 is not equal to string_2


*Integers*
Operator	                      Description
integer_1 -eq integer_2	        integer_1 is equal to integer_2
integer_1 -ne integer_2	        integer_1 is not equal to integer_2
integer_1 -gt integer_2	        integer_1 is greater than integer_2
integer_1 -ge integer_2	        integer_1 is greater than or equal to integer_2
integer_1 -lt integer_2	        integer_1 is less than integer_2
integer_1 -le integer_2	        integer_1 is less than or equal to integer_2


*Files*
Operator	                      Description
-e path/to/file	                file exists
-f path/to/file	                file exists and is a regular file (not a directory)
-d path/to/file	                file exists and is a directory



## Examples

Example 1: Output a string if it is longer than 0.
```sh
string='Hello'

if [[ -n $string ]]
then
  echo $string
fi
```

Example 2: Compare two integers and output a string if they are equal.
```sh
integer_1=10
integer_2=10

if [[ $integer_1 -eq $integer_2 ]]
then
  echo $integer_1 and $integer_2 are the same!
fi
```
We can simply combine variables and strings when passing arguments to commands such as echo.


Example 3: Output 'File exists' if the file hello_world.sh exists.
```sh
if [[ -e ./hello_world.sh ]]
then
  echo 'File exists'
fi
```

# **Testing Multiple Conditions**


Example 1: nested `if` statement
```sh
integer=4

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10

  if [[ $integer -lt 5 ]]
  then
    echo $integer is also less than 5
  fi
fi
```

Example 2: two conditional branches with `if` and `else`
```sh
integer=15

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
else
  echo $integer is not less than 10
fi
```

Example 3: three conditional branches with `if`, `elif`, and `else`
```sh
integer=15

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
elif [[ $integer -gt 20 ]]
then
  echo $integer is greater than 20
else
  echo $integer is between 10 and 20
fi
```

Example 4: matching two conditions using `&&` (and)
```sh
integer=15

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20
fi
```

Example 5: matching one of two conditions using `||` (or)
```sh
integer=12

if [[ $integer -lt 5 ]] || [[ $integer -gt 10 ]]
then
  echo $integer is less than 5 or greater than 10.
fi
```

Example 6: negating conditions using `!` (not)
```sh
integer=8

if [[ ! ($integer -lt 5 || $integer -gt 10) ]]
then
  echo $integer is between 5 and 10.
fi
```

In the above example we use the ! operator. In bash or shell scripting, the ! character can be used in a number of different contexts. In the context of a test, it reverses the sense of that test (i.e. false becomes true, and true becomes false). We need to enclose our test in parentheses in order for bash to interpret the context correctly.



# **Loops**
Bash provides several looping constructs such as `for`, `until`, and `while` loops. The syntax for `while` and `until` loops is fairly similar; they both test a condition for truthiness and run while that condition remains true (in the case of `while`), or until that condition becomes true (in the case of `until`). A `for` loop is slightly different both syntactically and conceptually; instead of testing a condition, a `for` loop iterates through a list.

## *While*
```sh
counter=0
max=10

while [[ $counter -le $max ]]
do
  echo $counter
  ((counter++))
done
```
There are various ways to increment values in bash, but the `var++` notation is one of the most commonly used. The double parentheses on either side permit `arithmetic expansion`. 

## *Until*
```sh
counter=0
max=10

until [[ $counter -gt $max ]]
do
  echo $counter
  ((counter++))
done
```

## *For*
```sh
numbers='1 2 3 4 5 6 7 8 9 10'

for number in $numbers
do
  echo $number
done
```
In the above example we assign a variable `numbers` to a `string` of numbers separated by spaces, this forms our `list`. 


# **Functions**
Bash functions provide a way of containing one or more commands as a `chunk of code`. This chunk of code is named, and so can be executed later. Functions can optionally take one or more arguments.
```sh
greeting () {
  echo Hello $1
}

greeting 'Peter' # outputs 'Hello Peter'
```

The first argument we pass to the function has the variable `1` assigned to it within the context of the function. This variable is scoped to the function, which means we can access this variable within the function body but not outside of it. Subsequent arguments would have `2`, `3`, `4`, and so on assigned to them.

```sh
greeting () {
  echo "Hello $1"
  echo "Hello $2"
}

greeting 'Peter' 'Paul' # outputs 'Hello Peter' 'Hello Paul' on separate lines
```
*Note: we can interpolate variables in double-quoted strings.*
