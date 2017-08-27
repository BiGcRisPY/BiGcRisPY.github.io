class Tm < ApplicationRecord
  has_many :learnedtms, :class_name => "Learnedtm", :foreign_key => "tm_id"

  has_many :pokemons, through: :learnedtms

  belongs_to :move, :class_name => "Move", :foreign_key => "move_id"

end
