require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.

unless coach_answer_enhanced.to_s.strip.empty?
  your_message = gets.chomp.to_s
  coach_answer_enhanced(your_message)
end
