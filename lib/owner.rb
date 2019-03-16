require 'pry'
class Owner
  # code goes here
All = []
  attr_accessor :name, :pets
  attr_reader :species
  def initialize(name)
    @name = name
    @species = 'human'
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
    All << self
  end

  def self.all
  All
  end

  def self.count
    All.count
  end

  def self.reset_all
    All.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish)
    self.pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    self.pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    self.pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    self.pets.each do |all, pets|
# binding.pry
      pets.each do |pet|
        # binding.pry
       pet.mood = 'nervous'
     end
   end.clear
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

end
