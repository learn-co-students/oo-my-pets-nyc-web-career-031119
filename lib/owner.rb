class Owner
  @@all = []
  attr_reader :species
  attr_accessor :cool, :name, :pets

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    "I am a human."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
    fish.owner = self
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
    cat.owner = self
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
    dog.owner = self
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |type, animals|
      animals.each {|animal| animal.mood = "nervous"}
      animals.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.length
  end
end
