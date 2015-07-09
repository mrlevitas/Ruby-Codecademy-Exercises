# Aggregated by: Roman Levitas
# contact: mrlevitas@yahoo.com
# 7/7/2015

# This file is a collection of small Ruby programs for beginners. Each program
# usually focuses on & demonstrates a specific, or several, topics in Ruby.

# Basic programming knowledge assumed. 

# Initially put together as notes for personal use, I thought it might be of 
# benefit to others. 

# Enjoy!

# original course material:
# codecademy.com/en/tracks/ruby

################################################################################
# A "Case" Study (formatting capitalization)

# It makes our lives easier as programmers to make their input standard before 
# doing anything with it.

print "What's your first name?"
first_name = gets.chomp 
# gets input from the user. When getting input, Ruby automatically adds a 
# blank line (or newline) after each bit of input; chomp removes that extra line.
first_name.capitalize! # capitalizes the first letter of a string 
                       # and makes the rest of the letters lower case.

print "What's your last name?"
last_name = gets.chomp
last_name.capitalize! # '!' modifies the value contained w/in the variable itself

print "What city are you from?"
city = gets.chomp
city.capitalize!

print "What state or province are you from?"
state = gets.chomp
state.upcase!

puts "Your name is #{first_name} #{last_name} and you're from #{city}, #{state}!"
=begin
#{variable} 
is string interpolation: replaces variable as a placeholder w/ its value
=end

################################################################################
# Writing a letter from prison: Redacting a specified word from text input

puts "Text to search through: "
text = gets.chomp
puts "Word to redact: "
redact = gets.chomp

words = text.split(" ")

words.each do |word|
  if word != redact
    print word + " "
  else
    print "REDACTED "
  end
end

=begin
How might you improve this program?

1) Add an additional if statement to re-prompt the user for input if they don't enter anything
2) Think about how you might account for words in which the letter "c" sounds like an "s"
3) Think about how you might preserve the user's original capitalization
=end

################################################################################
# String Substitution: Donald Duck

print "Thtring, pleathe!: "
user_input = gets.chomp
user_input.downcase!

if user_input.include? "s"
  user_input.gsub!(/s/, "th")
else
  puts "Nothing to do here!"
end
  
puts "Your string is: #{user_input}"

################################################################################
# Histogram of words from Text

# Build a hash from that input. Each key in the hash will be a word from the 
# user; each value will be the number of times that word occurs.

puts "Text please: "
text = gets.chomp

words = text.split(" ")

# initialize defualt value to 0
frequencies = Hash.new(0) # if accessing non-existent key, default spits out "Nil"
words.each { |word| frequencies[word] += 1 }
# can't use ! operator
# the .sort_by function returns an array of arrays 
frequencies = frequencies.sort_by {|a, b| b } # .sort_by returns an array of arrays
frequencies.reverse! # we reverse the array order so that the colors with the 
                     # largest counts are first.
frequencies.each { |word, frequency| puts word + " " + frequency.to_s }


# sample input:
# "the rain in Spain falls mainly on the plain"

# sample output:
=begin

the 2
falls 1
on 1
mainly 1
in 1
rain 1
plain 1
Spain 1

=end


################################################################################
# Checking Primes

def prime(n)
  puts "That's not an integer." unless n.is_a? Integer
  is_prime = true
  for i in 2..n-1
    if n % i == 0
      is_prime = false
    end
  end
  if is_prime
    puts "#{n} is prime!"
  else
    puts "#{n} is not prime."
  end
end

prime(2)
prime(9)
prime(11)
prime(51)
prime(97)

################################################################################
# sort books

books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

# Sort your books in descending order, in-place below

books.reverse!

#-------------------------------------------------------------------------------

def alphabetize(arr, rev=false)
  if rev
    arr.sort { |item1, item2| item2 <=> item1 }
  else
    arr.sort { |item1, item2| item1 <=> item2 }
  end
end

books = ["Heart of Darkness", "Code Complete", "The Lorax", "The Prophet", "Absalom, Absalom!"]

puts "A-Z: #{alphabetize(books)}"
puts "Z-A: #{alphabetize(books, true)}"


################################################################################
# Evens

numbers = [1, 2, 3, 4, 5, 6]
evens = []

numbers.each do |number|
  if number % 2 == 0
    evens.push(number)
  end
end

print evens
# prints '[2, 4, 6]'

################################################################################
# A Night at the Movies w/ CRUD functionality
# utilizing Case syntax

movies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}

puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp.downcase
case choice
when 'add'
  puts "What movie do you want to add?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What's the rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been added with a rating of #{rating}."
  else
    puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
  end
when 'update'
  puts "What movie do you want to update?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the new rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been updated with new rating of #{rating}."
  end
when 'display'
  movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end
when 'delete'
  puts "What movie do you want to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    movies.delete(title.to_sym)
    puts "#{title} has been removed."
  end
else
  puts "Sorry, I didn't understand you."
end


################################################################################
# case: when/then
# you can fold it up like so:

case language
  when "JS" then puts "Websites!"
  when "Python" then puts "Science!"
  when "Ruby" then puts "Web apps!"
  else puts "I don't know!"
end

################################################################################
#  conditional assignment operator: ||=. It's made up 
# of the or (||) logical operator and the normal = assignment operator.
favorite_book = nil
puts favorite_book

favorite_book ||= "Cat's Cradle"
puts favorite_book

favorite_book ||= "Why's (Poignant) Guide to Ruby"
puts favorite_book

favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book


# Cat's Cradle
# Cat's Cradle
# Why's (Poignant) Guide to Ruby

################################################################################
# upto and downto

95.upto(100) { |num| print num, " " }
# Prints 95 96 97 98 99 100

################################################################################
# Refactoring a Program 
# making it more concise, readable, and Ruby-esque

$VERBOSE = nil    # We'll explain this at the end of the lesson.
require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)

  unless n.is_a? Integer
    return "n must be an integer."
  end

  if n <= 0
    return "n must be greater than 0."
  end
  
  prime_array = [] if prime_array.nil?
  
  prime = Prime.new
  for num in (1..n)
    prime_array.push(prime.next)
  end
  return prime_array
end

first_n_primes(10)

#-------------------------------------------------------------------------------
# $VERBOSE = nil , this allowed us to use the old-style Prime.new from Ruby 1.8

$VERBOSE = nil    # We'll explain this at the end of the lesson.
require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)

    return "n must be an integer." unless n.is_a? Integer
    return "n must be greater than 0." if n <= 0
  
    # prime_array = [] if prime_array.nil?
    prime_array ||= []
  
    prime = Prime.new
    n.times do
      prime_array << prime.next
    end
    
    prime_array
end

first_n_primes(10)


#-------------------------------------------------------------------------------
# new Ruby, shorter program

require 'prime'

def first_n_primes(n)
  # Check for correct input!
  "n must be an integer" unless n.is_a? Integer
  "n must be greater than 0" if n <= 0

  # The Ruby 1.9 Prime class makes the array automatically!
  prime = Prime.instance
  prime.first n
end

first_n_primes(10)

################################################################################
# BLOCK example
odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]

ints = odds_n_ends.select{ |x| x.is_a? Integer}


################################################################################
#PROCs (Procedures) examples

multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end

(1..100).to_a.select(&multiples_of_3)

#-------------------------------------------------------------------------------
cube = Proc.new { |x| x ** 3 }
# We can then pass the proc to a method that would 
# otherwise take a block, and we don't have to rewrite the block over and over!
[1, 2, 3].collect!(&cube)
# ==> [1, 8, 27]
[4, 5, 6].map!(&cube)
# ==> [64, 125, 216]
# (The .collect! and .map! methods do the exact same thing.)

# The & is used to convert the cube proc into a block 
# (since .collect! and .map! normally take a block). 
# We'll do this any time we pass a proc to a method that expects a block.

#-------------------------------------------------------------------------------
floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]

round_down = Proc.new do |n|
    n.floor
end

ints = floats.collect(&round_down)

#-------------------------------------------------------------------------------
# Here at the amusement park, you have to be four feet tall
# or taller to ride the roller coaster. Let's use .select on
# each group to get only the ones four feet tall or taller.

group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

# Complete this as a new Proc
over_4_feet = Proc.new {|height| height >= 4}

# Change these three so that they use your new over_4_feet Proc
can_ride_1 = group_1.select( &over_4_feet )
can_ride_2 = group_2.select( &over_4_feet)
can_ride_3 = group_3.select( &over_4_feet)

#-------------------------------------------------------------------------------
ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]

# Add your code below!

under_100 = Proc.new{|age| age < 100}

youngsters = ages.select(&under_100)
#-------------------------------------------------------------------------------
# symbols, meet procs

strings = ["1", "2", "3"]
nums = strings.map(&:to_i)

numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
strings_array = numbers_array.map(&:to_s)

################################################################################
# LAMBDA examples
# lambda { |param| block }

crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}


first_half = lambda {|key , value| value < "M"}

a_to_m = crew.select(&first_half)

#-------------------------------------------------------------------------------
strings = ["leonardo", "donatello", "raphael", "michaelangelo"]

symbolize = lambda { |x| x.to_sym }

symbols = strings.collect(&symbolize)
#-------------------------------------------------------------------------------
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

symbol_filter = lambda {|param| param.is_a? Symbol }

symbols = my_array.select(&symbol_filter)

################################################################################
# Lambdas vs. Procs

=begin  
First, a lambda checks the number of arguments passed to it, while a proc does not. 
This means that a lambda will throw an error if you pass it the wrong number of arguments, 
whereas a proc will ignore unexpected arguments and assign nil to any that are missing.

Second, when a lambda returns, it passes control back to the calling method; 
when a proc returns, it does so immediately, without going back to the calling method.
=end


def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!" # implicit return
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!" # impllicit return
end

puts batman_ironman_lambda

# Batman will win!
# Iron Man will win!