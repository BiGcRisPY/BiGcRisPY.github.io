class Learnedtm < ApplicationRecord
  belongs_to :pokemon, :class_name => "Pokemon", :foreign_key => "pokemon_id"
  belongs_to :tm, :class_name => "Tm", :foreign_key => "tm_id"
end
