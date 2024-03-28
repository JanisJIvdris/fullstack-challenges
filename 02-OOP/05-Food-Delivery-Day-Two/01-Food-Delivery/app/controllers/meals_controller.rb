require_relative "../models/meal"
require_relative "../views/meal_view"

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @meal_view = MealView.new
  end

  def add
    name = @meal_view.ask_for("name")
    price = @meal_view.ask_for("price").to_i
    new_meal = Meal.new({ name: name, price: price })
    @meal_repo.create(new_meal)
  end

  def edit
    list
    index = @meal_view.ask_to_edit.to_i - 1
    meal_to_edit = @meal_repo.all[index]
    new_name = @meal_view.ask_for_new("name")
    new_price = @meal_view.ask_for_new("price")
    meal_to_edit.name = new_name
    meal_to_edit.price = new_price
    @meal_repo.save_csv
  end

  def destroy
    list
    index = @meal_view.ask_to_delete.to_i - 1
    @meal_repo.all.delete_at(index)
    @meal_repo.save_csv
  end

  def list
    meals = @meal_repo.all
    @meal_view.display_list(meals)
  end
end
