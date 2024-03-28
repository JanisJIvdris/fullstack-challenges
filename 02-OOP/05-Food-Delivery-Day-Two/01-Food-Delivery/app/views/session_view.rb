class SessionView
  def ask_for(thing)
    puts "Please enter your #{thing}"
    gets.chomp
  end

  def welcome_message(username)
    puts "Welcome #{username}"
  end

  def display_riders(riders)
    riders.each_with_index do |rider, i|
      puts "#{i + 1}. Name: #{rider.username}"
    end
  end

  def ask_for_rider
    puts "Which Rider is delivering the order?"
    puts "Index?"
    gets.chomp.to_i - 1
  end
end
