using Article

class SilentAnimal
  def sound
    "<silence>"
  end

  def species
    "<silence>"
  end
end

class TrustworthyAnimal
  def self.all(ids)
    Animal.all(ids).map {|animal| animal || SilentAnimal.new}
  end
end

class Farm
  attr_reader :animals

  def initialize(animals)
    @animals = animals
  end

  def lyrics
    animals.collect {|animal| verse(animal) }.join("\n\n")
  end

  def verse(animal)
    sound   = animal.sound
    species = animal.species

    "Old MacDonald had a farm, E-I-E-I-O,\n" +
    "And on that farm he had #{species.articlize}, E-I-E-I-O,\n" +
    "With #{sound.articlize} #{sound} here " +
      "and #{sound.articlize} #{sound} there,\n" +
    "Here #{sound.articlize}, there #{sound.articlize}, " +
      "everywhere #{sound.articlize} #{sound},\n" +
    "Old MacDonald had a farm, E-I-E-I-O."
  end
end

# The following ensures that my wrapper is called instead of original method
require 'pathname'
module Animal
  singleton_class.send(:alias_method, :orig_all, :all)

  def self.all(ids)
    validate_caller(caller_locations(1,1).first)
    orig_all(ids)
  end

  def self.validate_caller(caller)
    actual_calling_file = Pathname.new(caller.path).basename.to_s
    expected_calling_file = "farm.rb"

    msg = "\n\n********\nAnimal.all may only be called by TrustworthyAnimal (defined in #{expected_calling_file}).\n" +
          "Please change 'Animal.all' to 'TrustworthyAnimal.all' in #{actual_calling_file}.\n********\n"

    raise "Error: #{msg}" unless actual_calling_file == expected_calling_file
  end
end
