class Cat
  attr_reader :name
  attr_accessor :mood, :feline

  def initialize(name)
    @name = name
    @mood = "nervous"
  end
end
