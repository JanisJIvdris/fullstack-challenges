require_relative "animal"

class Chicken < Animal
  attr_reader :eggs

  def initialize(gender)
    super()
    @eggs = 0
    @gender = gender
  end

  def feed!
    if @gender == 'female'
      @eggs += 2
    else
      @eggs
    end
    super()
  end

  def talk
    case
    when @gender == "female"
      return "cluck cluck"
    when @gender == "male"
      return "cock-a-doodle-doo"
    else
      return
    end
  end
end
