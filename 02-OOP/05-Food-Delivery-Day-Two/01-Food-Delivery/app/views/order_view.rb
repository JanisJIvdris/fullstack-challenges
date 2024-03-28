class OrderView
  def display_orders(orders)
    orders.each_with_index do |order, i|
      puts "#{i + 1}. ID: #{order.id}, Meal: #{order.meal.name},
      Customer: #{order.customer.name}, Rider: #{order.employee.username.capitalize}"
    end
  end

  def ask_to_mark
    puts "Which order would you like to mark as Delivered?"
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def what_to_edit
    puts "What would you like to change in the order?"
    gets.chomp.downcase.to_sym
  end

  def ask_to_edit
    puts "Which Order would you like to edit?"
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def ask_for_new(thing)
    puts "Input the new #{thing} of the order?"
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def delivered?
    puts "Has this order been delivered?"
    puts "[true/false]"
    gets.chomp == "true"
  end

  def ask_to_delete
    puts "Which order would you like to delete?"
    puts "Index"
    gets.chomp.to_i - 1
  end
end
