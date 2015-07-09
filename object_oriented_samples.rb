# Aggregated by: Roman Levitas
# contact: mrlevitas@yahoo.com
# 7/7/2015

# This file shows & explains common conventions, rules, and syntax for Ruby 
# classes & OOP design. Basic programming knowledge assumed. 

# Initially put together as notes for personal use, I thought it might be of 
# benefit to others. 

# Enjoy!

# original course material:
# codecademy.com/en/tracks/ruby


# Classes

class Person
    def initialize(name)
    	# Use @ before a variable to signify that it's an instance variable. 
  		# This means that the variable is attached to the instance of the class.
        @name = name
    end
end


matz = Person.new("Yukihiro")

#-------------------------------------------------------------------------------
class Language

  def initialize(name, creator)
    @name = name
    @creator = creator
  end
	
  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description

#-------------------------------------------------------------------------------
# different scopes examples

# GLOBAL scope
# '$' marks a varaiable as global, it can be accessed from anywhere
class MyClass
  $my_variable = "Hello!"
end

puts $my_variable

# OUTPUT
# Hello!
#-------------------------------------------------------------------------------

# INSTANCE scope
# '@' marks a variable as an instance variable
# instance variables belong to a particular object (or "instance")
class Person
  def initialize(name, age, profession)
    @name = name
    @age = age
    @profession = profession
  end
end

#-------------------------------------------------------------------------------
# CLASS scope
# '@@' marks a variable as a class variable
# class variables are attached to entire classes, not just instances of classes

# Because there's only one copy of a class variable shared by all instances of a class

# i.e.  we can use a class variable to keep track of the number of instances of 
# that class we've created

class Person
  # Set your class variable to 0 on line 3
  @@people_count = 0
  
  def initialize(name)
    @name = name
    # Increment your class variable on line 8
    @@people_count += 1
  end
  
  def self.number_of_instances
    # Return your class variable on line 13
    return @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"

# Number of Person instances: 2





#-------------------------------------------------------------------------------
# Putting it all together!

class Computer
  # '$' marks a varaiable as global
  $manufacturer = "Mango Computer, Inc."
  # '@@' marks a class variable, in this case a hash
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username # implicit return
  end
  
  def self.display_files
    @@files # implicit return
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

#OUTPUT

# Current user: Dave
# Manufacturer: Mango Computer, Inc.
# Files: {:hello=>"Hello, world!"}


################################################################################
# Ruby on Rails source code example
# RecordInvalid is a class

def create_record(attributes, raise_error = false)
  record = build_record(attributes)
  yield(record) if block_given?
  saved = record.save
  set_new_record(record)
  raise RecordInvalid.new(record) if !saved && raise_error
  record
end

################################################################################
# INHERITANCE

# SuperBadError class that inherits from ApplicationError. 
# Note that we don't define the display_error method in the body of SuperBadError,
# but it will still have access to that method via inheritance

class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

# Define new class that inherits above class
# You can read "<" as "inherits from."
class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

# Error! Error!
#-------------------------------------------------------------------------------
# Inherit but OVER RIDE 

class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!
class Dragon < Creature
   def fight
       return "Breathes fire!" # overides base/parent class'/superclass' fight method
    end
end

#-------------------------------------------------------------------------------
# ther can be only ONE SUPERCLASS
# Any given Ruby class can have only one superclass. Some languages allow a class 
# to have more than one parent, which is a model called multiple inheritance. 
# This can get really ugly really fast, which is why Ruby disallows it.


class Creature
  def initialize(name)
    @name = name
  end
end

class Person
  def initialize(name)
    @name = name
  end
end

class Dragon < Creature; end
class Dragon < Person; end

# superclass mismatch for class Dragon

################################################################################

class Machine
  @@users = {}
  
  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end
  
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end

  # Because @@users is a class variable, we'll use a class method to grab it.
  # A class method belongs to the class itself, and 
  # for that reason it's prefixed with the class name
  def Machine.get_users
    @@users
  end
end

my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Machine.get_users}"

# groceries.txt was created by eric at 2015-07-08 10:43:03 +0000.
# todo.txt was created by you at 2015-07-08 10:43:03 +0000.
# Users: {"eric"=>668, "you"=>56789}

################################################################################
# Public vs Privte class methods
# unless specified, class methods are public by default

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  public    # This method can be called from outside the class.
  
  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end
  
  private   # This method can't! It's an internal class helper function
  
  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end
end

eric = Person.new("Eric", 26)
eric.about_me
eric.bank_account_number


# I'm Eric and I'm 26 years old!
# ERROR: private method `bank_account_number' called for #

################################################################################
# attr_reader, attr_writer, and attr_accessor

# We can use attr_reader to access a variable and attr_writer to change it.
# example below transforms a method that returns name & a method that updates
# job

# pass instance variables (as symbols) to attr_reader or attr_writer

# attr_accessor to make a variable readable and writeable

class Person
  def initialize(name, job)
    @name = name
    @job = job
  end
  
  def name
    @name
  end
  
  def job=(new_job)
    @job = new_job
  end
end

#-------------------------------------------------------------------------------

class Person
    
  def initialize(name, job)
    @name = name
    @job = job
  end

    attr_reader :name    
    attr_writer :job 

end

################################################################################
# MODULES

# a toolbox that contains a set methods and constants
# Modules are very much like classes, only modules can't create instances and 
# can't have subclasses. They're just used to store things!

# It doesn't make sense to include variables in modules, since variables 
# (by definition) change (or vary). Constants, however, are supposed to always 
# stay the same, so including helpful constants in modules is a great idea.

# Ruby constants are written in ALL_CAPS and are separated with underscores

module Circle

  PI = 3.141592653589793
  
  def Circle.area(radius)
    PI * radius**2
  end
  
  def Circle.circumference(radius)
    2 * PI * radius
  end
end

#-------------------------------------------------------------------------------
# scope resolution operator

# module::constant

# Tells Ruby where you're looking for a specific bit of code. 
# If we say Math::PI, Ruby knows to look inside the Math module to get that PI, 
# not any other PI (such as the one we created in Circle).
#-------------------------------------------------------------------------------
require 'module'
# to pull in module
#-------------------------------------------------------------------------------
include 'module'
# you no longer have to prepend your constants and methods with the module name.
# Since everything has been pulled in, you can simply write PI instead of 
# Math::PI.

class Angle
  include Math  
  
  attr_accessor :radians
  
  def initialize(radians)
    @radians = radians
  end
  
  def cosine
    cos(@radians) # instead of MATH::cos
  end
end

acute = Angle.new(1)
acute.cosine

################################################################################
# MIXINs

# When a module is used to mix additional behavior and information into a class,
# it's called a mixin. Mixins allow us to customize a class without having to 
# rewrite code!

# it's like creating a method common to multiple classes or hardcoding inheritance

module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action 
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump

# ThePresent has a .now method that we'll extend to TheHereAnd

################################################################################
# EXTEND

# The extend keyword mixes a module's methods at the class level. 
# This means that class itself can use the methods, as opposed to instances of the class.

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}
    :#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now

################################################################################
# BANK ACCOUNT example using public/private methods


class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end
  
  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end
  
  def withdraw(pin_number, amount)
    if pin_number == pin
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end
  
  private
  
  def pin
    @pin = 1234
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end
end

my_account = Account.new("Eric", 1_000_000)
# Underscores are ignored. You can put them in to make them more readable.
my_account.withdraw(11, 500_000)
my_account.display_balance(1234)
my_account.withdraw(1234, 500_000)
my_account.display_balance(1234)

# Access denied: incorrect PIN.
# Balance: $1000000.
# Withdrew 500000. New balance: $500000.
# Balance: $500000.



=begin
How could you improve this class? You might:

1) Include a deposit method that lets users add money to their accounts
2) Include error checking that prevents users from overdrawing their accounts
3) Create CheckingAccounts or SavingsAccounts that inherit from Account
=end


