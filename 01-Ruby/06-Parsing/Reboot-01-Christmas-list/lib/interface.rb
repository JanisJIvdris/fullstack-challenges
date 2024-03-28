# TODO: you can build your christmas list program here!

# action = ["list","add","delete","quit"]
gift_list = ["BMW", "Hand granade", "Lego", " NVIDIA® GeForce RTX™ 4090"]

#arr = gift_list.each_slice(1).to_a

arr = Hash[gift_list.map {|key, value| [key, value]}]
hash = arr.update(arr) {|key, value| value == false}

p hash


=begin stupid way
test = gift_list.flat_map {|x| [[], x] }.tap(&:pop)
test_2 =  test.each {|element| element.gsub("[]", "[X]")}
puts test_2
p test
=end


p arr

puts "Welcome to your Christmas gift list"
puts "Which action [list|add|delete|mark|idea|quit]?"
action = gets.chomp.downcase

until action == "quit"

  case action
  when "list"
    # list
    #puts "TODO: list items"
    hash.each_with_index do |(gift, value), index|
      if value == false
        check_mark = ""
      else
        check_mark = "X"
      end
      puts "#{index + 1}-[#{check_mark}] :list has #{gift} "
    end
p hash

  when "add"
    # add
    #puts "TODO: ask user an item and add it to gift list"
    puts "What do you want to insert in gift list?"
    gift = gets.chomp.downcase
    hash[gift] = false

  when "delete"
    # delete
    #puts "TODO: ask user the index of item to delete and delete it"
    puts "at what index u wana delete?"
    index = gets.chomp.to_i - 1
    gift_list.delete_at(index)

  when "mark"
    puts "at what index already did buying item that was in list but you have bought (give the index)?"
    index = gets.chomp.to_i - 1
    key_to_change = hash.keys[index]
    value_to_change = hash[key_to_change]

    hash[key_to_change] = !value_to_change

    p hash

  when "idea"
    puts "ideas on Etsy"
    keyword = gets.chomp







  else
    puts "Please, provide valid input!"
  end
  puts "Which action [list|add|delete|mark|idea|quit]??"
action = gets.chomp.downcase
end
puts "Goodbye"
