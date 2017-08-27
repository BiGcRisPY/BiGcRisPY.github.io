class AddTrainerIdToMytms < ActiveRecord::Migration[5.0]
  def change
    add_column :mytms, :trainer_id, :integer
  end
end
