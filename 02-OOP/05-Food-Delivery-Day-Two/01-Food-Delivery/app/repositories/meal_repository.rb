require "csv"
require_relative "../models/meal"
require_relative "base_repository"

class MealRepository < BaseRepository
  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id]    = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(row)
    end
    @next_id = @elements.last.id
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |row|
      row << ["id", "name", "price"]
      @elements.each do |meal|
        row << [meal.id, meal.name, meal.price]
      end
    end
  end
end
