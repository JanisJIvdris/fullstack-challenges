def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  stop_words = File.read(stop_words_file_name).split

  word_count = Hash.new(0)

  file.read


  File.open(file_name, "r").each_line do |_line|
    # Do something with the line variable
    words = line.split

    words.each do |word|
      word.downcase!
      next if stop_words.include?(word)

      word_count[word] += 1
    end
  end

  sorted_word_count = word_count.sort_by { |_word, count| -count }

  result = sorted_word_count.first(number_of_word).to_h
  result.each do |word, count|
    puts "#{word}: #{count}"
  end
  result
end

puts most_common_words('source-text.txt', 'stop_words.txt', 3)
