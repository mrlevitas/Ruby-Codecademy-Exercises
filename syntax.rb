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
################################################################################
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
# STRINGS

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

################################################################################
# In-place assignment, really cool & compact!

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
# check if n variable is an integer
n = 5
j = 5.0

n.is_a? Integer # true
j.is_a? Integer # false
################################################################################
# LOOPS

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
# Iterators
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
# Hash literal notation. 
# We call it that because you literally describe what you want in the hash.

my_hash = { "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}

puts my_hash["name"]
puts my_hash["age"]
puts my_hash["hungry?"]


#-------------------------------------------------------------------------------
# Setting a variable equal to Hash.new creates a new, empty hash; 
# it's the same as setting the variable equal to empty curly braces ({}).

my_hash = Hash.new


pets = Hash.new
pets["Stevie"] = "cat"

#-------------------------------------------------------------------------------
# Two ways of iterating over key-value pairs in Ruby:

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

################################################################################
# symbols
puts "string".object_id
puts "string".object_id

puts :symbol.object_id
puts :symbol.object_id

7515900
7515680
319048
319048

# http://discuss.codecademy.com/t/is-a-ruby-symbol-some-kind-of-pointer-to-a-memory-address/992
=begin
Symbols make good hash keys for a few reasons:

They're immutable, meaning they can't be changed once they're created;

Only one copy of any symbol exists at a given time, so they save memory;

Symbol-as-keys are faster than strings-as-keys because of the above two reasons.
=end




# Converting between strings and symbols is a snap.

:sasquatch.to_s
# ==> "sasquatch"

"sasquatch".to_sym
# ==> :sasquatch
# The .to_s and .to_sym methods are what you're looking for!


################################################################################
# Implicit Return

# Ruby's methods will return the result of the last evaluated expression.

def method_add(j, k)
  j + k # last & only expression in method, implies return
end

sum = (1, 2)
# sum = 3

################################################################################
# Semicolons & combining code into one ling
# if you want to end a Ruby statement without going to a new line, 
# you can just type a semicolon. This means you can write something like

class ClassName

  def method; end

end