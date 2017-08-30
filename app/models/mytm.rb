class Mytm < ApplicationRecord
  belongs_to :tm, :class_name => "Tm", :foreign_key => "tm_id"
  belongs_to :trainer, :class_name => "Trainer", :foreign_key => "trainer_id"

  validates :tm_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :tm_id, uniqueness: { scope: :trainer_id }
  
end
