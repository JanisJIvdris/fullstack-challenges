# TODO: Implement the Cookbook class that will be our repository
require 'csv'
require_relative 'recipe'
class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: true).map do |row|
      Recipe.new(row["name"], row["description"])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "w", write_headers: true, headers: ["name", "description"]) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
