# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#JSON made better
#require 'json/stream'
=begin
Cardtype.destroy_all
Cardsubtype.destroy_all
Card.destroy_all
Artist.destroy_all
Type.destroy_all
=end
require 'json'

file = File.read('AllCards.json')
data_hash = JSON.parse(file)

data_hash.each { |card| puts card[1]['name'].inspect}


300.times do

  newcard = Card.new(
      :name       => card[1]['name']
      :cmc        => card[1]['cmc']
      #t.string "colors"
      :type       => card[1]['type']
      #:supertypes => card[1]['supertypes']
      :text       => card[1]['text']
      :flavor     => card[1]['flavor']
      #artist_id
      :layout     => card[1]['layout']
      :imagename: => card[1]['imagename']
    )

      #Not all cards have p/t
      #:power      => card[1]['power']
      #:toughness  => card[1]['toughness']
end

#data_hash.each { |card| puts card.name }
