class Pokedex < ApplicationRecord
  belongs_to :pokemon, :class_name => "Pokemon", :foreign_key => "pokemon_id"
  belongs_to :trainer, :class_name => "Trainer", :foreign_key => "trainer_id"

  has_many :learnedmoves, through: :pokemon

  validates :current_level, presence: :true
  validates :pokemon_id, uniqueness: { scope: [ :trainer_id, :nickname ] }
end
