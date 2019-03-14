class Owner

  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all.clear
  end

  attr_accessor :pets, :name
  attr_reader :species

  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def walk_dogs
    pets[:dogs].each{ |dog| dog.mood = "happy"} 
  end

  def play_with_cats
    pets[:cats].each{ |cat| cat.mood = "happy"} 
  end

  def feed_fish
    pets[:fishes].each{ |fish| fish.mood = "happy"} 
  end

  def sell_pets
    pets.each {|species, names| names.each{ |pet| pet.mood = "nervous"} } 
    pets.each {|pet, info| info.clear}
  end

  def list_pets
    result = "I have"
    pet_count = {}
    pets.each {|species, names| pet_count[species] = names.count}
    pet_count.each do |pet, count|
      if pet == :fishes
        result << " #{count} fish," 
      elsif pet == :dogs
        result << " #{count} dog(s),"
      else
        result << " and #{count} cat(s)"
      end
    end
    result += "."
  end
end
