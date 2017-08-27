class Learnedmove < ApplicationRecord
  belongs_to :pokemon, :class_name => "Pokemon", :foreign_key => "pokemon_id"
  belongs_to :move, :class_name => "Move", :foreign_key => "move_id"
end
