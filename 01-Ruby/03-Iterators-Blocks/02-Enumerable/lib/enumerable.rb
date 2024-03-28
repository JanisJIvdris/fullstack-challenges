array = [5, 6, 3, 9, 1]
def sum_odd_indexed(array)
  # TODO: computes the sum of elements at odd indexes (1, 3, 5, 7, etc.)
  #       You should use Enumerable#each_with_index
  array.select.each_with_index { |_, i| i.odd? }.sum_odd_indexed
end

puts sum_odd_indexed(array)

num = [2, 6, 3, 9, 1]
def even_numbers(array)
  # TODO: Return the even numbers from a list of integers.
  #       You should use Enumerable#select
  array.select { |i| i.even? }
end
puts even_numbers(num)

array = ["Max", "Zvalda", "Nelda", "UgaBuga"]
max_length = 5
def short_words(array, max_length)
  # TODO: Take an array of words, return the array of words not exceeding max_length characters
  #       You should use Enumerable#reject
  array.reject { |i| i.length > max_length }
end

puts short_words(array, max_length)

array = [5, 6, 3, 9, 1]
limit = 5
def first_under(array, limit)
  # TODO: Return the first number from an array that is less than limit.
  #       You should use Enumerable#find
  array.find { |i| i < limit }
end

puts first_under(array, limit)

array = ["Max", "Zvalda", "Nelda", "UgaBuga"]
def add_bang(array)
  # TODO: Take an array of strings and return a new array with "!" appended to each string.
  #       You should use Enumerable#map
  array.map { |i| i.concat("!") }
end

puts add_bang(array)

array = ["Max", "Zvalda", "Nelda", "UgaBuga"]
def concatenate(array)
  # TODO: Concatenate all strings given in the array.
  #       You should use Enumerable#reduce
  array.reduce(:+)
end

puts concatenate(array)

array = ["say", "my", "name", "say", "my", "name"]
def sorted_pairs(array)
  # TODO: Reorganize an array into slices of 2 elements, and sort each slice alphabetically.
  #       You should use Enumerable#each_slice
  array.each_slice(2).map(&:sort)
end

p sorted_pairs(array)
