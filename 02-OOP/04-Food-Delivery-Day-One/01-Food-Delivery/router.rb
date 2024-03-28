# TODO: implement the router of your app.
class Router
  def initialize(meal_controller, customer_controller)
    @meal_controller = meal_controller
    @customer_controller = customer_controller
    @running = true
  end

  def run
    puts "ayoo! I't da Bolt Food"
    puts "-----------------------------------------"

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  # rubocop:disable Metrics/MethodLength
  def route_action(action)
    case action
    when 1 then @meal_controller.add
    when 2 then @meal_controller.edit
    when 3 then @meal_controller.destroy
    when 4 then @meal_controller.list
    when 5 then @customer_controller.add
    when 6 then @customer_controller.edit
    when 7 then @customer_controller.destroy
    when 8 then @customer_controller.list
    when 9 then stop
    else
      puts "Please press choose, we ain't got all day"
    end
  end
  # rubocop:enable Metrics/MethodLength

  def stop
    @running = false
  end

  def display_tasks
    puts "\nWhat do you want to do next?"
    puts "1. Add a new meal"
    puts "2. Edit a meal"
    puts "3. Delete a meal"
    puts "4. List all meals"
    puts "5. Add a new customer"
    puts "6. Edit a customer"
    puts "7. Delete a customer"
    puts "8. List all customers"
    puts "9. Skidaddle"
  end
end
