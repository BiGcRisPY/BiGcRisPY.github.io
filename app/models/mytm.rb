class Mytm < ApplicationRecord
  belongs_to :tm, :class_name => "Tm", :foreign_key => "tm_id"
  belongs_to :trainer, :class_name => "Trainer", :foreign_key => "trainer_id"

end
