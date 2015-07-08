# Classes

# By convention, class names start with a capital letter and 
# use CamelCase instead of relying_on_underscores.
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
# different scopes example

# '$' marks a varaiable as global
class MyClass
  $my_variable = "Hello!"
end

puts $my_variable



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