#  TODO: Define your Controller Class here, to orchestrate the other classes
require_relative "recipe"
require_relative "cookbook"
require_relative "view"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
  end

  def list
    @cookbook.all
  end

  def add(name, description)
    recipe = Recipe.new(name, description)
    @cookbook.create(recipe)
  end

  def remove(index)
    @cookbook.destroy(index)
  end
end
5
