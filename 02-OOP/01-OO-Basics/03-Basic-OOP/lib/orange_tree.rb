class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_accessor :age, :height, :fruits, :dead

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
    @chance_of_death = 0
  end

  def dead?
    @age == 100 || @dead
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits != 0 && @age > 5 && @age < 15
  end

  def one_year_passes!
    return if @dead

    @age += 1
    @chance_of_death += 0.01 if @age >= 50
    @dead = rand(0...100) < @chance_of_death * 100
    @height += 1 if @age <= 10

    @fruits = case @age
              when 6..9 then 100
              when 10..14 then 200
              else 0
              end
  end
end
