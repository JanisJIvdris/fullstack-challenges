DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Veggie Burger" => 540,
  "Vegan Burger" => 350,
  "Sweet Potatoes" => 230,
  "Salad" => 15,
  "Iced Tea" => 70,
  "Lemonade" => 90
}
# 600
MEALS = {
  "Cheesy Combo" => ["Cheese Burger", "Sweet Potatoes", "Lemonade"], # 620
  "Veggie Combo" => ["Veggie Burger", "Sweet Potatoes", "Iced Tea"],
  "Vegan Combo" => ["Vegan Burger", "Salad", "Lemonade"]
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  # TODO: return number of calories for a less constrained order
  total = 0
  orders.each do |order|
    if DISHES_CALORIES.key?(order)
      # iterate over combos and sum calories of every dish using DISHES_CALORIES
      total += DISHES_CALORIES[order]
    else
      total += poor_calories_counter(MEALS[order][0], MEALS[order][1], MEALS[order][2])
    end
  end
  total
end
order = ["Veggie Combo", "Salad", "Vegan Combo", "Lemonade"]
puts calories_counter(order)
