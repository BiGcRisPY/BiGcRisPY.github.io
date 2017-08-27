class Move < ApplicationRecord
  has_many :learnedmoves, :class_name => "Learnedmove", :foreign_key => "move_id"
  has_many :tms, :class_name => "Tm", :foreign_key => "move_id"

  has_many :pokemons, through: :learnedmoves

end
