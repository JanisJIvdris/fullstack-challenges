# TODO: Write a seed
require 'faker'

puts "Creating lil' users..."

5.times do
  user = User.create(username: Faker::JapaneseMedia::Naruto.character, email: Faker::Internet.email)
  5.times do
    Post.create(title: Faker::JapaneseMedia::Naruto.eye, url: Faker::Internet.url, user_id: user.id)
  end
end
# user.save!test
puts 'Finished!'
