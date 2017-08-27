class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.integer :offense_id
      t.integer :defense_id
      t.float :effectiveness

      t.timestamps

    end
  end
end
