# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

## Battle
csv_text = File.read(Rails.root.join('lib', 'seeds', 'battles.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Battle.new
  b.offense_id = row['offense']
  b.defense_id = row['defense']
  b.effectiveness = row['effectiveness']
  b.save
end
puts "#{Battle.count} saved"

## Learnedmove
csv_text = File.read(Rails.root.join('lib', 'seeds', 'learnedmoves.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Learnedmove.new
  b.pokemon_id = row['poke_id']
  b.level_learned = row['level_learned']
  b.move_id = row['move_id']
  b.save
end
puts "#{Learnedmove.count} saved"

##learnedtms
csv_text = File.read(Rails.root.join('lib', 'seeds', 'learnedtms.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Learnedtm.new
  b.pokemon_id = row['poke_id']
  b.tm_id = row['tm_id']
  b.save
end
puts "#{Learnedtm.count} saved"

##Moves
csv_text = File.read(Rails.root.join('lib', 'seeds', 'moves.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Move.new
  b.name = row['move']
  b.effect = row['effect']
  b.save
end
puts "#{Move.count} saved"

##Pokemons
csv_text = File.read(Rails.root.join('lib', 'seeds', 'pokemons.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  b = Pokemon.new
  b.creature = row['pokemon']
  b.evo_level = row['evolution_level']
  b.evo_outcome = row['evolution_outcome']
  b.image = row['image']
  b.save
end
puts "#{Pokemon.count} saved"

##Poketypes
csv_text = File.read(Rails.root.join('lib', 'seeds', 'poketypes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  pt = Poketype.new
  pt.pokemon_id = row['poke_id']
  pt.type_id = row['type_id']
  pt.save
end
puts "#{Poketype.count} saved"

##TMs
csv_text = File.read(Rails.root.join('lib', 'seeds', 'tms.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  tm = Tm.new
  tm.move_id = row['move_id']
  tm.save
end
puts "#{Tm.count} saved"

##Types
csv_text = File.read(Rails.root.join('lib', 'seeds', 'types.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Type.new
  t.title = row['type']
  t.save
end
puts "#{Type.count} saved"
