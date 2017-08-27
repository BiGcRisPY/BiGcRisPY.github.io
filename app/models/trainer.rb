class Trainer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pokedexes, :class_name => "Pokedex", :foreign_key => "trainer_id"
  has_many :mytms, :class_name => "Mytm", :foreign_key => "trainer_id"

end
