def word_contains_at_least_two_p(sentence)
  # TODO: return the first word in `sentence` containing two 'p's or more
  regexp = /\b(?:\w*p\w*){2,}\b/
  sentence.match(regexp)[0]
end
puts word_contains_at_least_two_p("appropriate perfect apocalypse")
puts 'second'

def word_before_exclamation_mark(sentence)
  # TODO: return the first word located before an exclamation mark
  # Hint: you may want to use `()` groups!
  sentence.match(/(\b\w+\b)(?=\s*!)/)[0]
end
puts word_before_exclamation_mark("you? me!")
puts word_before_exclamation_mark("Reveal the logos' colors:\
  Elegant shapes, some have evolved to a very iconized style.\
  Definitely a vivid color scheme with bright orange and shiny yellow,\
  many shades of blue, oscillating between purple and indigo! but not much green")

puts 'third'
def four_letter_word(sentence)
  # TODO: return the first four-letter word starting with 'b', followed with a comma `,`
  sentence.match(/\b\bb\w{3}(?=\b,)/)[0]
end
puts four_letter_word("Reveal the logos' colors:\
  Elegant shapes, some have evolved to a very iconized style.\
  Definitely a vivid color scheme with bright orange and shiny yellow,\
  many shades of blue, oscillating between purple and indigo! but not much green")

def last_five_letters(sentence)
  # TODO: return the last five letters of the sentence
  sentence.match(/.{5}(?=$)/)[0]
end

def word_contains_ll(sentence)
  # TODO: return the first word containing two consecutive 'l'
  sentence.match(/\b\w*ll\w*\b/)[0]
end

def six_letter_word(sentence)
  # TODO: return the first six-letter word, composed of letters from 'a' to 'r'
  sentence.match(/\b[a-rA-R]{6}\b/)[0]
end

def all_capital_letters(sentence)
  # TODO: return all the capital letters as a string
  # Hint: use `scan` to get all the occurences then `join` them
  sentence.scan(/[A-Z]/).join
end
