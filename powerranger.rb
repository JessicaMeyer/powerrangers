class Person

	attr_accessor :name, :caffeine_level, :strength
	
	def initialize (name, caffeine_level=0)
		@name = name
		@caffeine_level = caffeine_level
	end

	def run
		puts "#{name} is getting away!"
	end

	def scream
		puts "AHHHHH!"
	end

	def drink_coffee(num_cups)
		@caffeine_level += num_cups
	end

end

module Fight

	def punch(person_to_punch)
		if @strength >= 5
			puts "#{person_to_punch.name}, was sommersaulted into the air!"
		else
			puts "#{person_to_punch.scream} #{person_to_punch.run}"
		end
		@caffeine_level -= 1
		@strength -= 1
	end
end

class PowerRanger < Person
	
	attr_accessor :strength, :caffeine_level

	include Fight

	def initialize(name, strength, color)
		super(name)
		@strength = strength
		@color = color
	end

	# def punch(person_to_punch)
	# 	if @strength >= 5
	# 		puts "#{person_to_punch.name}, was sommersaulted into the air!"
	# 	else
	# 		puts "#{person_to_punch.scream} #{person_to_punch.run}"
	# 	end
	# 	@caffeine_level -= 1
	# 	@strength -= 1
	# end

	def rest
		@strength += 1
		puts "#{name} is resting!"
	end

	def use_megasword(person_to_punch)
		@strength -= 5000
		puts "#{person_to_punch.name} is knocked out cold."
	end
end

class EvilNinja < Person

	attr_accessor :strength, :caffeine_level
	
	include Fight

	def initialize(name, strength, evilness)
		super(name)
		@strength = strength
		@evilness = evilness
	end

	# def punch(person_to_punch)
	# 	if @strength >= 2
	# 		puts "#{person_to_punch.name}, was sommersaulted into the air!"
	# 	else
	# 		puts "#{person_to_punch.scream} #{person_to_punch.run}"
	# 	end
	# end

	def cause_mayhem(person)
		person.caffeine_level = 0
		puts "#{person.name}, you are done! You have no more caffeine or strength."
	end
end

def fight_scene

# ---- Person class ----- #

joe = Person.new("Joe")
puts joe.scream
puts joe.run
puts joe.drink_coffee(3)

# ---- PowerRanger class ---- #

chris = PowerRanger.new("Chris", 100, "red")
chris.punch(joe)
chris.rest
chris.use_megasword(joe)

# ------ EvilNinja Class ----- #

jess = EvilNinja.new("Jess", 299, "high")
jess.punch(chris)
jess.cause_mayhem(joe)

end

fight_scene

  
# 2.1.0 :003 > load 'powerranger.rb'
# AHHHHH!

# Joe is getting away!

# 3
# Joe, was sommersaulted into the air!
# Chris is resting!
# Joe is knocked out cold.
# Chris, was sommersaulted into the air!
# Joe, you are done! You have no more caffeine or strength.
#  => true 

