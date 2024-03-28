class Restaurant
  # TODO: add relevant accessors if necessary

  # should update restraunt rating
  attr_accessor :filter_by_city, :city, :name, :rates, :average_rating

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @rates = []
    @average_rating = 0
  end

  def rate(new_rate)
    @rates << new_rate
    @average_rating = @rates.sum / @rates.size
  end

  #  McDonald = Restaurant.new
  #  restraunt.filter_by_city
  def self.filter_by_city(restraunts, city)
    restraunts.select { |restraunt| restraunt.city == city }
  end

  # TODO: implement .filter_by_city and #rate methods
end
