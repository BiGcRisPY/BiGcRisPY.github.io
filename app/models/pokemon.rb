class Pokemon < ApplicationRecord

  has_many :poketypes, :class_name => "Poketype", :foreign_key => "pokemon_id"
  has_many :learnedmoves, :class_name => "Learnedmove", :foreign_key => "pokemon_id"
  has_many :learnedtms, :class_name => "Learnedtm", :foreign_key => "pokemon_id"
  has_many :pokedexes, :class_name => "Pokedex", :foreign_key => "pokemon_id"

  has_many :types, through: :poketypes
  has_many :moves, through: :learnedmoves
  has_many :tms, through: :learnedtms

end
