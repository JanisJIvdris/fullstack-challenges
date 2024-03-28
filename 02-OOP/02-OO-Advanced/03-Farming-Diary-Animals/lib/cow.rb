require_relative "animal"

class Cow < Animal
  attr_reader :milk

  def initialize
    super()
    @milk = 0
  end

  def feed!
    @milk += 2
    super()
  end

  def talk
    return "moo"
  end
end
