class MealView
  def display_list(meals)
    meals.each_with_index do |meal, i|
      puts "#{i + 1}. #{meal.name} is €#{meal.price}."
    end
  end

  def ask_for(thing)
    puts "What is the #{thing} of the recipe?"
    gets.chomp
  end

  def ask_for_new(thing)
    puts "Whats is the new #{thing} of the recipe?"
    gets.chomp
  end

  def ask_to_edit
    puts "Which Meal would you like to change?"
    puts "Index"
    gets.chomp
  end

  def ask_to_delete
    puts "Which Meal would you like to delete?"
    puts "Index"
    gets.chomp
  end

  def ask_for_meal
    puts "Which Meal would you like to add to the order?"
    puts "Index?"
    gets.chomp.to_i - 1
  end
end
