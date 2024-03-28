class Restaurant
  def initialize(location, food, stars)
    @location = location
    @food = food
    @stars = stars
  end

  attr_reader :location, :food, :stars

  def restaurant=(new_location)
    @location = new_location
  end
end

my_restaurant = Restaurant.new("Amsterdam", "Italian", "5")

puts "Restaurnt is in #{my_restaurant.location}, its #{my_restaurant.food} food and has #{my_restaurant.stars} stars."
