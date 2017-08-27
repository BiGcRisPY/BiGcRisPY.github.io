class Battle < ApplicationRecord
  belongs_to :offense, :class_name => "Type", :foreign_key => "offense_id"
  belongs_to :defense, :class_name => "Type", :foreign_key => "defense_id"

end
