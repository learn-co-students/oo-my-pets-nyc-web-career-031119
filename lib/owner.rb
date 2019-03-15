require 'pry'
require_relative "./cat.rb"
require_relative "./dog.rb"
require_relative "./fish.rb"

class Owner
attr_reader :species
attr_accessor :name, :pets
  @@all = []

  def initialize(species)
    @species = species
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each_with_index do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each_with_index do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each_with_index do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species,animals|
      animals.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = []
  end

  def list_pets
    fish_count = 0
    dog_count = 0
    cat_count = 0
    @pets.each do |species,animals|
      if species == :fishes
        fish_count = animals.length
      elsif species == :dogs
        dog_count = animals.length
      elsif species == :cats
        cat_count = animals.length
      end
    end
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end
