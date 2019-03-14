require 'pry'
class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @species = "human"
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
    @@all.clear
  end

  def say_species
    "I am a #{species}."
  end

  def pets
    if @pets == nil
      @pets = {}
      @pets[:cats] = []
      @pets[:dogs] = []
      @pets[:fishes] = []
    end
    @pets
  end

  def buy_fish(name)
    self.pets
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
  end

  def buy_cat(name)
    self.pets
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end

  def buy_dog(name)
    self.pets
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |pet_group, pet|
      pet.map do |indiv_pet|
        indiv_pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    num_fish = @pets[:fishes].length
    num_cat = @pets[:cats].length
    num_dog = @pets[:dogs].length
    "I have #{num_fish} fish, #{num_dog} dog(s), and #{num_cat} cat(s)."
  end

end
