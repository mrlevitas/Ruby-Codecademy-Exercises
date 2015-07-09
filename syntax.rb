# Aggregated by: Roman Levitas
# contact: mrlevitas@yahoo.com
# 7/7/2015

# This file shows & explains common ruby syntax for beginners. Basic programming
# knowledge assumed. 

# Initially put together as notes for personal use, I thought it might be of 
# benefit to others. 

# Enjoy!

# original course material:
# codecademy.com/en/tracks/ruby

################################################################################
# ^ above pound signs indicate a new topic

#-------------------------------------------------------------------------------
# ^ above dash signs indicate a sub-section in topic or new example for topic


################################################################################
################################################################################
################################################################################
# Let's get started!
################################################################################
# Comments!

# I'm a one line comment, just like in python!

=begin
I'm 
a
Block Comment!
=end

################################################################################
# Naming Conventions

# Local variables start with a lowercase letter and words should be
# separated by underscores.

# Class names start with a capital letter and use CamelCase instead of 
# relying_on_underscores.

################################################################################
# Getting used to 'end'

# In Ruby methods, if/else, loops, switch/case statements, among other things,
# we close them by using 'end' instead of using '{}'s

def method
  # do stuff
end


if true
  # do stuff
end

################################################################################
# exceptttt....

ruby_is_eloquent = true
ruby_is_ugly = false

# no 'end'  in one line if/unless
puts "Ruby is eloquent!" if ruby_is_eloquent
print "Ruby's not ugly!" unless ruby_is_ugly

# prints both lines!
# puts == "put string", includes newline at the end
# print does not inlcude new line

################################################################################
# Ternary conditional expression. 
# Called "ternary" because it takes 3 arguments: 
# a boolean, an expression to evaluate if the boolean is true, and 
# an expression to evaluate if the boolean is false.

# boolean ? 'Do this if true': 'Do this if false'

puts 3 < 4 ? "3 is less than 4!" : "whatever"

three = 3
puts three == 3 ? "Of course." : "What?"
# ==> puts "Of course."

################################################################################
# Unless: unique to Ruby control flow

hungry = false

unless hungry
    puts "I'm writing Ruby programs!"
else
    puts "Time to eat!"
end

################################################################################
# Case Statement (switch)
# If we have a lot of conditions to check Ruby provides us with a concise alternative.

case language
  when "JS"
    puts "Websites!"
  when "Python"
    puts "Science!"
  when "Ruby"
    puts "Web apps!"
  else
    puts "I don't know!"
end
But you can fold it up like so:

case language
  when "JS" then puts "Websites!"
  when "Python" then puts "Science!"
  when "Ruby" then puts "Web apps!"
  else puts "I don't know!"
end
################################################################################
#                  Conditional assignment operator: 
# ||= 
# Made up of the or (||) logical operator and the normal = assignment operator.
# Assigns a variable if it hasn't already been assigned

favorite_book = nil
puts favorite_book

favorite_book ||= "Cat's Cradle" # Since the value of the variable was nothing 
                                 # before, Ruby goes ahead and sets it
puts favorite_book

favorite_book ||= "Why's (Poignant) Guide to Ruby"
puts favorite_book

favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book

#
# Cat's Cradle
# Cat's Cradle
# Why's (Poignant) Guide to Ruby

################################################################################
#                         STRINGS

#length of string
"I love espresso".length
# ==> 15

# reversing strings (can be used on other things, such as arrays)
"roman levitas".reverse   
# ==> "sativel namor"

# changing case
puts "roman".upcase
puts "ROMAN".downcase
puts "roman".capitalize # capitializes first character & donwcases the rest
# check if string includes substring
string_to_check = "I contain a substring!"
string_to_check.include? "substring" #true

#-------------------------------------------------------------------------------
# .to_s  (changes variable to string) VS string interpolation

age = 26
"I am " + age.to_s + " years old."
# ==> "I am 26 years old."
"I am " << age.to_s << " years old."
# ==> "I am 26 years old."

"I am #{age} years old." # string interpolation
# ==> I am 26 years old.

################################################################################
#             In-place assignment, really cool & compact!

=begin
capitalize: capitalizes the first letter of a string and makes the rest of the 
letters lower case. 
You might notice the ! at the end of capitalize. 
This modifies the value contained within the variable answer itself. 
The next time you use the variable answer you will get the results of answer.capitalize
=end

answer = "hello!"
answer.capitalize!
# answer => Hello!

answer = answer.capitalize # re-assignment not necesarry with '!' operator


################################################################################
# check if a variable is an integer
n = 5
j = 5.0

n.is_a? Integer # true
j.is_a? Integer # false

################################################################################
#                             LOOPS

# While loop
counter = 1
while counter < 11
  puts counter
  counter = counter + 1
end

#-------------------------------------------------------------------------------
# Until loop
# complement of While loop

i = 0
until i == 6
  i += 1 # note assignment operator, increments variable i by 1
end
puts i # i = 6

#-------------------------------------------------------------------------------
# 'for' loops 
# uses ranges: note the ellipsis vs '..' syntax

#inclusive: 1-15
for num in 1..15
  puts num
end

# exclusive: 1-14
for num in 1...15
  puts num
end

#-------------------------------------------------------------------------------
# The .times method is like a super compact for loop: 
# it can perform a task on each item in an object a specified number of times.

10.times { print "Chunky bacon!" }

#-------------------------------------------------------------------------------
# Next
# The next keyword can be used to skip over certain steps in the loop

# skip evens

for i in 1..5
  next if i % 2 == 0
  print i
end

################################################################################
#                        ITERATORS
# The simplest iterator is the loop method. 
# You can create a basic (but infinite!) loop by simply typing

loop { print "Hello, world!" }

# In Ruby, curly braces ({}) are generally interchangeable with the keywords 
do #(to open the block) 
# and 
end #(to close it). 

# Knowing this, we can write a smarter loop than the one above:

i = 0
loop do
  i += 1
  print "#{i}"
  break if i > 5 # avoids looping infinitely
end

#-------------------------------------------------------------------------------
# Looping over arrays
# The .each method can apply an expression to each element of an object, 
# one at a time. 
# for example '.each' iterator can be called on arrays

# curly brace syntax
object.each { |item| # Do something }

# do/end syntax
object.each do |item| 
# Do something 
end

# The variable name between | | is a placeholder for each element of the object
# you're using .each on.

################################################################################
# 2-d  Array syntax

multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]

multi_d_array.each { |x| puts "#{x}\n" }

#-------------------------------------------------------------------------------
# iterating over 2-d Array
# http://stackoverflow.com/a/12875288/4260179

a = [[1, 2], [3, 4]]
a.each do |sub|
  sub.each do |int|
    puts int
  end
end
# Output:
#   1
#   2
#   3
#   4

#-------------------------------------------------------------------------------
#2-d arrays continued

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each do | sub_array |
  sub_array.each do | y |
    puts y
  end
end

#-------------------------------------------------------------------------------

a = [[1, 2], [3, 4]]
a.each do |(x, y)|
  puts x + y
end
# Output:
#   3
#   7

################################################################################
#                  HASHES
# like JavaScript objects or Python dictionaries.
# key-value pairs replace numeric 0...n inidcies of arrays
# can iterate over values using '.each' just like with arrays
hash = {
  key1 => value1,
  key2 => value2,
  key3 => value3
}

#-------------------------------------------------------------------------------
# Hash literal notation (aka hash rocket):
# We call it that because you literally describe what you want in the hash.

my_hash = { "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}

puts my_hash["name"]
puts my_hash["age"]
puts my_hash["hungry?"]


#-------------------------------------------------------------------------------
# hash constructor notation:
# Setting a variable equal to Hash.new creates a new, empty hash; 
# it's the same as setting the variable equal to empty curly braces ({}).

my_hash = Hash.new


pets = Hash.new
pets["Stevie"] = "cat"

#-------------------------------------------------------------------------------
# Three ways of iterating over key-value pairs in Ruby:

# 1) 
# curly braces using .each

# family hash
family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

# friends array
friends = ["Milhouse", "Ralph", "Nelson", "Otto"]

# arrays vs hashes but similar syntax
# curly braces
friends.each { |x| puts "#{x}" }
family.each { |x ,y| puts "#{x}: #{y}" }

# note: we need two placeholder variables '||' to represent each key/value pair

#-------------------------------------------------------------------------------
# 2) do/end using .each

restaurant_menu = {
  "noodles" => 4,
  "soup" => 3,
  "salad" => 2
}

restaurant_menu.each do |item, price|
  puts "#{item}: #{price}"
end

#-------------------------------------------------------------------------------
# 3)
# .each_key and .each_value
# do exactly what you'd expect:
# 'key:value' syntax will be discussed below under "Symbols"

my_hash = { one: 1, two: 2, three: 3 }

my_hash.each_key { |k| print k, " " }
# ==> one two three

my_hash.each_value { |v| print v, " " }
# ==> 1 2 3

#-------------------------------------------------------------------------------
# Default Hash value

my_hash = Hash.new("Trady Blix")
# Now if you try to access a nonexistent key in my_hash, you'll get 
# "Trady Blix" as a result.

# Otherwise, hash would return Nil. More on this below.

#-------------------------------------------------------------------------------
# .select
# filters a hash for values that meet certain criteria

grades = { alice: 100,
  bob: 92,
  chris: 95,
  dave: 97
}

grades.select {|name, grade| grade < 97}
# ==> {:bob=>92, :chris=>95}

grades.select { |k, v| k == :alice }
# ==> {:alice=>100}

################################################################################
# Collect on arrays
# same as .map

# .collect returns a copy
my_nums = [1, 2, 3]
my_nums.collect { |num| num ** 2 }
# ==> [1, 2, 3]

my_nums.collect! { |num| num ** 2 }
# ==> [1, 4, 9]

################################################################################
#                           SPLAT

# splat arguments. Splat arguments are arguments preceded by a *, which signals 
# to Ruby: "Hey Ruby, I don't know how many arguments there are about to be, but
# it could be more than one."

def what_up(greeting, *bros)
  bros.each { |bro| puts "#{greeting}, #{bro}!" }
end
 
what_up("What up", "Justin", "Ben", "Kevin Sorbo")

################################################################################
# Combined Comparison Operator

  <=> 

# It returns 0 if the first operand (item to be compared) equals the second, 
# 1 if first operand is greater than the second, and 
# -1 if the first operand is less than the second.

# Using it in .sort
=begin
A block that is passed into the sort method must return either 1, 0, -1. 
It should return -1 if the first block parameter should come before the second, 
1 if vice versa, and 0 if they are of equal weight, meaning one does not 
come before the other (i.e. if two values are equal).
=end

#-------------------------------------------------------------------------------
book_1 = "A Wrinkle in Time"
book_2 = "A Brief History of Time"

book_1 <=> book_2

# output: 1

#-------------------------------------------------------------------------------

def alphabetize(arr, rev=false)
  if rev
    arr.sort { |item1, item2| item2 <=> item1 }
  else
    arr.sort { |item1, item2| item1 <=> item2 }
  end
end

books = ["Heart of Darkness", "Code Complete", "The Lorax", "The Prophet", "Absalom, Absalom!"]

puts "A-Z: #{alphabetize(books)}" # rev defaults to true as per above 
puts "Z-A: #{alphabetize(books, true)}"

################################################################################
# Nil == Null

=begin
Along with false, Nil is one of two non-true values in Ruby. 
(Every other object is regarded as "truthy," meaning that if you were to type 
if 2 or if "bacon", the code in that if statement would be run.)

It's important to realize that false and nil are not the same thing: 
false means "not true," while nil is Ruby's way of saying "nothing at all."
=end

################################################################################
# Symbols

# while there can be multiple different strings that all have the same value, 
# there's only one copy of any particular symbol at a given time.
puts "string".object_id
puts "string".object_id

puts :symbol.object_id
puts :symbol.object_id

7515900
7515680
319048
319048

# symbols are not pointers
# http://discuss.codecademy.com/t/is-a-ruby-symbol-some-kind-of-pointer-to-a-memory-address/992

#-------------------------------------------------------------------------------
# Symbol applications

=begin
Symbols make good hash keys for a few reasons:

They're immutable, meaning they can't be changed once they're created;

Only one copy of any symbol exists at a given time, so they save memory;

Symbol-as-keys are faster than strings-as-keys because of the above two reasons.
=end

#-------------------------------------------------------------------------------
# Syntax
# Symbols always start with a colon (:). 
# They must be valid Ruby variable names, so the first character after the colon
# has to be a letter or underscore (_)

sounds = {
  :cat => "meow",
  :dog => "woof",
  :computer => 10010110,
}

#-------------------------------------------------------------------------------
# Syntax Ruby 1.9 (new)
# 1) colon goes at end of symbol
# 2) rocket gets replaced

movies = {
  primer: "Awesome",
  memento: "Not as good the 2nd time",
}

#-------------------------------------------------------------------------------
# Converting between strings and symbols

# symbol to string
:sasquatch.to_s
# ==> "sasquatch"

# string to symbol
"sasquatch".to_sym
"sasquatch".intern
# ==> :sasquatch
# both .to_sym & .intern accomplish the same thing

#-------------------------------------------------------------------------------
# benchmark symbols vs strings
require 'benchmark'

string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

string_time = Benchmark.realtime do
  100_000.times { string_AZ["r"] }
end

symbol_time = Benchmark.realtime do
  100_000.times { symbol_AZ[:r] }
end

puts "String time: #{string_time} seconds."
puts "Symbol time: #{symbol_time} seconds."

# String time: 0.021631389 seconds.
# Symbol time: 0.009277166 seconds.

################################################################################
# Implicit Return

# Ruby's methods will return the result of the last evaluated expression.

def method_add(j, k)
  j + k # last & only expression in method, implies return
end

sum = (1, 2)
# sum = 3

################################################################################
# Concatenation operator 
# Instead of the .push method, you can use '<<'

[1, 2, 3] << 4
# ==> [1, 2, 3, 4]

# it also works on strings! 
"Yukihiro " << "Matsumoto"
# ==> "Yukihiro Matsumoto"

################################################################################
# Semicolons & combining code into one line
# if you want to end a Ruby statement without going to a new line, 
# you can just type a semicolon. This means you can write something like

class ClassName

  def method; end

end

################################################################################
# BLOCKs

# nameless methods
# similar to anonymous functions in JavaScript or lambdas in Python
# Blocks can be defined with either the keywords do and end or with 
# curly braces ({}).


# Block vs Method: Capitalize a word

# method that capitalizes a word
def capitalize(string) 
  puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array
["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"} 
# prints "Ryan", then "Jane"
# string[n] is bracket notation, treating each string like an array of characters

#-------------------------------------------------------------------------------
# Yield w/blocks
def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }

# We're in the method!
# Yielding to the block...
# >>> We're in the block!
# We're back in the method!

#-------------------------------------------------------------------------------
# yielding to block w/ param
def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }

# In the method! Let's yield.
# My name is Kim.
# In between the yields!
# My name is Eric.
# Block complete! Back in the method.

################################################################################
# PROCs (Procedures)
# blocks w/ names

# Why use them?
#
=begin
1) Procs are full-fledged objects, so they have all the powers and abilities 
of objects. (Blocks do not.)
2) Unlike blocks, procs can be called over and over without rewriting them. 
This prevents you from having to retype the contents of your block every time 
you need to execute a particular bit of code.
=end
multiples_of_3 = Proc.new do |n| # Proc.new is a constructor
  n % 3 == 0
end

(1..100).to_a.select(&multiples_of_3) # note the '&'

#-------------------------------------------------------------------------------
# Call a Proc

# Unlike blocks, we can call procs directly by using Ruby's .call

test = Proc.new { # does something }
test.call
# does that something!

#-------------------------------------------------------------------------------
# Converting symbols to procs using &.
strings = ["1", "2", "3"]
nums = strings.map(&:to_i)
# ==> [1, 2, 3]

numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

strings_array = numbers_array.map(&:to_s)

################################################################################
# LAMBDAs
# Like procs, lambdas are objects. With the exception of a bit of syntax and 
# a few behavioral quirks, lambdas are identical to procs.

# lambda { |param| block }

=begin
1) A lambda checks the number of arguments passed to it, while a proc does not. 
This means that a lambda will throw an error if you pass it the wrong number of 
arguments, whereas a proc will ignore unexpected arguments and assign nil to 
any that are missing.
=end

=begin
2) Second, when a lambda returns, it passes control back to the calling method; 
when a proc returns, it does so immediately, without going back to the calling method.
=end

def lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })

################################################################################
# blocks, procs, and lambdas REVIEW
=begin
1) A block is just a bit of code between do..end or {}. 
   It's not an object on its own, but it can be passed to methods like .each or .select.
2) A proc is a saved block we can use over and over.
3) A lambda is just like a proc, only it cares about the number of arguments it gets and 
   it returns to its calling method rather than returning immediately.
=end