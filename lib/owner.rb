require 'pry'

class Owner

  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(species = "human")
    @species = species
    @name = name
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    pets[:dogs].map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].map do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.map do |animals, data|
      data.each do |k|
        k.mood = "nervous"
      end
    end
    pets.clear
  end

  def list_pets
    num_animals = []
    pets.each do |animals, v|
      num_animals << v.length
    end
    "I have #{num_animals[0]} fish, #{num_animals[1]} dog(s), and #{num_animals[2]} cat(s)."
  end



end



# owner[pets][fish] = []
#
# pets = {
# fish: [],
# dog: [],
# cat: []
# }
