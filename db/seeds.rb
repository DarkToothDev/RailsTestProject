require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cardtype.destroy_all
Cardsubtype.destroy_all
Card.destroy_all
Artist.destroy_all
Type.destroy_all

puts 'Seed Start'

#puts File.exist?('AllCards.json')
#puts File.exist?(File.join(File.dirname(__FILE__), 'AllCards.json'))

file = File.read(File.join(File.dirname(__FILE__), 'AllCards.json'))
data_hash = JSON.parse(file)

#data_hash.each { |card| puts card[1]['name'].inspect}

alex = Artist.new(name: 'Alex')
puts alex.inspect

10.times do
  artist = Artist.create(name: Faker::Name.unique.name)
  puts artist.inspect
end

test = Type.create(name: 'Creature')

4.times do
  type = Type.create(name: Faker::Witcher.unique.monster)
  puts type.inspect
end

3.times do
  subtype = Subtype.create(name: Faker::ElderScrolls.unique.creature)
  puts subtype.inspect
end

# Memory error here
#card = []
#data_hash.map { |item| card << item.last }.flatten.sample

goblins = data_hash.select {|card| card.include?('Goblin ')}

goblins.each do |card|
  puts card[1]["name"].inspect
end


goblins.each do  |card|
  artist = Artist.all.sample
  #card = data_hash.all?.sample
  #card = goblins.fetch(Faker::Number.between(1, goblins.length-1))

  newcard = Card.new(
      :name       => card[1]["name"],
      :cmc        => card[1]["cmc"],
      :colors     => 'Red', #Forcing all colors to be red for testing
      #:type       => card[1]["type"],
      :supertypes => 'Legendary', #card[1]['supertypes'],
      :text       => card[1]["text"],
      :flavor     => card[1]["flavor"],
      :artist_id  => artist.name,
      :layout     => card[1]["layout"],
      :imagename => card[1]["imagename"],
    )

    puts newcard.inspect
    #puts card.inspect
end


#data_hash.each { |card| puts card.name }
