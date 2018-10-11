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

alex = Artist.new(name: 'Alex Stratos')
puts alex.inspect

19.times do
  artist = Artist.create(name: Faker::Name.unique.name)
  puts artist.inspect
end

test = Type.create(name: 'Creature')

4.times do
  type = Type.create(name: Faker::Witcher.unique.monster)
  puts type.inspect
end

15.times do
  subtype = Subtype.create(name: Faker::ElderScrolls.unique.creature)
  puts subtype.inspect
end

# Memory error here
#card = []
#data_hash.map { |item| card << item.last }.flatten.sample

goblins = data_hash.select {|card| card.include?('Goblin ')}

phyrexia = data_hash.select {|card| card.include?('Phyrexian ')}

puts "Total cards: #{goblins.length + phyrexia.length} "

goblins.each do |card|
  artist = Artist.offset(rand(Artist.count)).first
  #card = data_hash.all?.sample
  #card = goblins.fetch(Faker::Number.between(1, goblins.length-1))
  puts artist.inspect

  newcard = Card.new(
      :name       => card[1]["name"],
      :cmc        => card[1]["cmc"].to_i,
      :colors     => 'Red', #Forcing all colors to be red for testing
      #:type       => card[1]["type"],
      :supertypes => 'Legendary', #card[1]['supertypes'],
      :text       => card[1]["text"],
      :flavor     => Faker::Matz.quote.to_s,
      :artist     => artist,
      :layout     => card[1]["layout"],
      :imagename => card[1]["imagename"],
    )
  if newcard.save
    puts newcard.inspect
    else
    puts 'Did not save successfully...'
    puts newcard.inspect
  end
end

phyrexia.each do |card|
  artist = Artist.all.sample

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
    newcard.save
    puts newcard.inspect

  end


all_cards = Card.all

all_cards.each do |card|
  thetype = Type.offset(rand(Type.count)).first
  Cardtype.create(
    type: thetype,
    card: card,
  )
end

all_cards.each do |card|
  subtype = Subtype.offset(rand(Subtype.count)).first

  Cardsubtype.create(
    card: card,
    subtype: subtype,
  )

end

puts 'Final test series:'
firsta = all_cards.first
puts firsta.inspect
puts firsta.cardsubtypes.inspect
puts 'Part B:'
firstb = Subtype.all.first
puts firstb.inspect
puts "Then inspect cardsubtypes"
puts firstb.cardsubtypes.inspect
puts "Then find its card...?"
firstb.cardsubtypes.each do |item|
  puts item.card.inspect
end

puts 'Final Part C:'
firstc = Cardsubtype.first
puts firstc.card.name
puts firstc.subtype.name


puts "Made #{all_cards.length} cards"

#data_hash.each { |card| puts card.name }
