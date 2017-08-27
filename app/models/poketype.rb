class Poketype < ApplicationRecord
  belongs_to :pokemon, :class_name => "Pokemon", :foreign_key => "pokemon_id"
  belongs_to :type, :class_name => "Type", :foreign_key => "type_id"

end
