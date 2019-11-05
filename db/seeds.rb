# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'fr'
require 'database_cleaner'
DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

puts "tout est détruit"

5.times do 
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars(number: 30), email: "#{Faker::Lorem.characters(number: 10)}@yopmail.com", password: "youhou", password_confirmation: "youhou")
end
puts "users créés"

10.times do
	Event.create!(admin_id: User.all.sample.id, start_date:  Faker::Date.forward(days: 365), duration: rand(1..10)*5, title: Faker::Lorem.paragraph_by_chars(number: 6), description: Faker::Lorem.paragraph_by_chars(number: 30), price: rand(1..100), location: Faker::Address.city)
end
puts "events créés"

20.times do 
	Attendance.create!(user_id: User.all.sample.id, event_id: Event.all.sample.id)
end
puts "attendances créés"