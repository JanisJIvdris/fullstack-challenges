require 'nokogiri'

filepath = "results.html"
# 1. We get the HTML page content
html_content = File.open(filepath)
# 2. We build a Nokogiri document from this file
doc = Nokogiri::HTML.parse(html_content)


titles = []
# 3. We search for the correct elements containing the items' title in our HTML doc
doc.search('.v2-listing-card__info .v2-listing-card__title').first(5).each do |element|
  # 4. For each item found, we extract its title and print it

  titles << element.text.strip[0..30]


  #puts element.text.strip
end

results.each_with_index do |item, i|
  puts "#{i + 1}"

p titles
["Custom Quote | Personalized Quote Sign, Motivational Quotes, Mindfulness Gift, Brainy Quote, Motivational Saying", "Circumcision Survivor T-Shirt | Funny Shirt, Humor Tshirt, Funny Gift, Satire Shirt,  Shirts With Message", "Lactose Tolerant Funny Meme Gift T shirt For Friends,Lactose Intolerant Milk LMAO Shirt For Teenager,Cringy Shirts Gen Z Humor Appareal Tee", "Shadow Wizard Money Gang Funny Gifts Meme's T Shirt For Man,Gen Z Humor Ganjalf Shirt For Teenager,Gangstar Appareal Quotes About to Laugh", "Born To Shit Forced To Wipe Shirt Funny Meme Gift For Friends,Goth Skull Fire,Born 2 Shit Appareal,Born Shit Wipe Trend Memes TShirt For Man", "Lactose Intolerant Funny Meme Gift T shirt For Friends,Free Milk LMAO Shirt For Lactose Tolerant,Cringy Shirts Gen Z Diarreha Shirt Teenager", "Wolf Ripping Shirt Meme Funny, Offensive Gifts shirts, Oddly Specific, Sarcastic, Gift for Best Friend, Alpha Wolf, Werewolf, Literally Me"]
