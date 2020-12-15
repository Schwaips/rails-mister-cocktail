# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
readUrl = open(url).read
parsing = JSON.parse(readUrl)

ingredient = parsing['drinks']

puts "--starting seeding ingredient -- "
ingredient.each do |ingredient|
Ingredient.create!(name: ingredient['strIngredient1'])
puts "Create #{ingredient['strIngredient1']}"
end

puts "--end seeds---"

# puts "--starting seeding -- "
# cocktails = Cocktail.all
# cocktails.each do |c|
# c.image = "https://source.unsplash.com/1600x900/?cocktails"
# c.save!
# puts "---adding picture for #{c.name}, url : #{c.image}"
# end

# puts "--end seeds---"

puts "--starting feeding cocktails ---"
require 'faker'

20.times do
  c = Cocktail.new(name: Faker::Creature::Animal.name, image: "https://source.unsplash.com/1600x900/?cocktails" )
  c.save!
  puts "#{c.name} is saved!"
end

puts "--end seeding cocktails---
