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

