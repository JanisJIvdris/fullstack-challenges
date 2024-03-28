class CustomerView
  def display_list(customers)
    customers.each_with_index do |customer, i|
      puts "#{i + 1}. #{customer.name} lives at #{customer.address}."
    end
  end

  def ask_for(thing)
    puts "What is the #{thing} of the customer."
    gets.chomp
  end

  def ask_for_new(thing)
    puts "Whats is the new #{thing} of the customer?"
    gets.chomp
  end

  def ask_to_edit
    puts "Which Customer would you like to change?"
    puts "Index"
    gets.chomp
  end

  def ask_to_delete
    puts "Which Customer would you like to delete?"
    puts "Index"
    gets.chomp
  end
end
