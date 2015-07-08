# Compiled by: Roman Levitas
# contact: mrlevitas@yahoo.com
# 7/7/2015
# This file shows & explains common ruby syntax for beginners. Basic programming
# knowledge assumed. Initially put together as notes for personal use, I thought
# it might be of benefit to others. 
# Enjoy!

# original course material:
# codecademy.com/en/tracks/ruby

################################################################################
################################################################################
################################################################################
# ^ above pound signs indicate a new topic

#-------------------------------------------------------------------------------
# ^ above dash signs indicate sub-section in topic or new example for topic


################################################################################
################################################################################
################################################################################
# Let's get started!
# Comments!


# I'm a one line comment, just like python!

=begin
I'm 
a
Block Comment!
=end

################################################################################
# Getting used to 'end'
# In methods, if/else, loops, we close them by using 'end'

def method
  # do stuff
end


if true
  # do stuff
end

################################################################################
# In-place assignment

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
# check if string includes substring
string_to_check = "I contain a substring!"
if string_to_check.include? "substring"

################################################################################
# check if n variable is an integer
n = 5
j = 5.0

n.is_a? Integer # true
j.is_a? Integer # false
################################################################################
# 'for loop' syntax, note the ellipsis vs '..' syntax

#inclusive: 1-15
for num in 1..15
  puts num
end

# exclusive: 1-14
for num in 1...15
  puts num
end


################################################################################
# Iterator
# '.each' iterator can be called on arrays for example
object.each do |item| 
# Do something 
end

# The variable name between | | is a placeholder for each element of the object
# you're using .each on.


################################################################################
#The .times method is like a super compact for loop: 
# it can perform a task on each item in an object a specified number of times.

10.times { print "Chunky bacon!" }

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

a = [[1, 2], [3, 4]]
a.each do |(x, y)|
  puts x + y
end
# Output:
#   3
#   7

################################################################################
#                  HASHES

my_hash = { "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}

puts my_hash["name"]
puts my_hash["age"]
puts my_hash["hungry?"]


hash = {
  key1 => value1,
  key2 => value2,
  key3 => value3
}


my_hash = Hash.new
# Setting a variable equal to Hash.new creates a new, empty hash; 
# it's the same as setting the variable equal to empty curly braces ({}).

pets = Hash.new
pets["Stevie"] = "cat"

#-------------------------------------------------------------------------------
friends = ["Milhouse", "Ralph", "Nelson", "Otto"]

family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

#arrays vs hashes
friends.each { |x| puts "#{x}" }
family.each { |x ,y| puts "#{x}: #{y}" }

#-------------------------------------------------------------------------------
restaurant_menu = {
  "noodles" => 4,
  "soup" => 3,
  "salad" => 2
}

restaurant_menu.each do |item, price|
  puts "#{item}: #{price}"
end
#-------------------------------------------------------------------------------
#2-d arrays
s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each do | sub_array |
  sub_array.each do | y |
    puts y
  end
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