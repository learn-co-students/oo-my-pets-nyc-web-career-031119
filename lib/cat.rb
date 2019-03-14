class Cat
  attr_accessor :mood, :owner
  attr_reader :name

  @@all = []
  def initialize(name)
    @name = name
    @mood = "nervous"
    @@all << self
  end
end
