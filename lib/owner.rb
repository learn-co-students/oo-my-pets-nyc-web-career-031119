class Owner
  # code goes here

  @@all = []

attr_reader :species
attr_accessor :name, :pets, :mood

  def initialize(species)
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @name = name
    @species = species
    @@all << self
    @mood = mood
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
    self.pets[:dogs].last.mood = "happy"
  end

  def play_with_cats
    self.pets[:cats].last.mood = "happy"
  end

  def feed_fish
    self.pets[:fishes].last.mood = "happy"
  end

  def sell_pets
      self.pets.map do |x, info|
      info.each do |emotion|
        emotion.mood = "nervous"
      end
      end
    self.pets = {}
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
    end
  end

require 'pry'
