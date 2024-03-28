# NOTE: Read about BasicObject#object_id
# https://ruby-doc.org/core-2.7.5/BasicObject.html#method-i-__id__

# You can try launching `irb` to test some values
# irb> :foo.object_id
# irb> :foo.object_id
# irb> "foo".object_id
# irb> "foo".object_id

def are_identical_symbols_same_objects?
  # TODO: Answer the question by making this method to return true or false
  x = :sym
  y = :sym
  return (x.__id__ == y.__id__) && (:sym.__id__ == x.__id__)
end
puts are_identical_symbols_same_objects?

def are_identical_strings_same_objects?
  # TODO: Answer the question by making this method to return true or false
  x = "string"
  y = "string"
  return (x.__id__ == y.__id__) || ("string".__id__ == x.__id__)
end
puts are_identical_strings_same_objects?

# Remember, RTFM! Your doc is your friend
# - https://ruby-doc.org/core-2.7.5/String.html
# - https://ruby-doc.org/core-2.7.5/Symbol.html

def convert_string_to_symbol(a_string)
  # TODO: return the symbol version of the parameter `a_string` passed to this method
  return a_string.to_sym
end
p convert_string_to_symbol("Koala")
puts convert_string_to_symbol("Koala")

def convert_symbol_to_string(a_symbol)
  # TODO: return the string version of the parameter `a_symbol` passed to this method
  return a_symbol.to_s
end
p convert_symbol_to_string(:Koala)
puts convert_symbol_to_string(:Koala)


def me
  # TODO: return a Hash representing yourself, with keys such as age and name
  me = { age: 24, name: "Janis" }
  return me
end
p me
puts me

def fruits
  # TODO: return an array of fruits
  fruits = ["Banana", "not-banana"]
  return fruits
end

p fruits
puts fruits
