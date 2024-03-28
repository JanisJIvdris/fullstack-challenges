require_relative "wagon_sort"

array = %w[]

puts "Type a student name:"
student = gets.chomp

array << student

while student != ""
  puts "Type another student name or press enter to finish:"
  student = gets.chomp
  array << student if student != ""
end

lenght = wagon_sort(array).count

puts "Congratulations! Your Wagon has #{lenght} students:"

if lenght <= 1
  puts wagon_sort(array).join(' ')
else
  puts "#{wagon_sort(array)[0...-1].join(', ')} and #{wagon_sort(array).last(1).join(' ')}"
end



# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/core-2.7.5/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/core-2.7.5/String.html#method-i-chomp



# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
