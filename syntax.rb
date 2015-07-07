answer.capitalize!


=begin
First we introduce one new method, capitalize, here. It capitalizes the first letter of a string and makes the rest of the letters lower case. We assign the result to answer2
The next line might look a little strange, we don't assign the result of capitalize to a variable. Instead you might notice the ! at the end of capitalize. 
This modifies the value contained within the variable answer itself. The next time you use the variable answer you will get the results of answer.capitalize
=end


###########################################

if string_to_check.include? "substring"

#################################
#inclusive
for num in 1..15
  puts num
end

# exclusive
for num in 1...15
  puts num
end


##################################

object.each do |item| 
# Do something 
end

# The variable name between | | can be anything you like: it's just a placeholder for each element of the object you're using .each on.


#######################################
#The .times method is like a super compact for loop: it can perform a task on each item in an object a specified number of times.

10.times { print "Chunky bacon!" }

######################################
multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]

multi_d_array.each { |x| puts "#{x}\n" }

#################################################
###############HASHES############################
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

#-------------------------------------------
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

#---------------------------------------
restaurant_menu = {
  "noodles" => 4,
  "soup" => 3,
  "salad" => 2
}

restaurant_menu.each do |item, price|
  puts "#{item}: #{price}"
end
#-------------------------------------------
#2-d arrays
s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each do | sub_array |
  sub_array.each do | y |
    puts y
  end
end


###############################
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


#######################################
# Ruby's methods will return the result of the last evaluated expression.