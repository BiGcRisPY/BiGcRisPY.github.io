class CreateLearnedmoves < ActiveRecord::Migration[5.0]
  def change
    create_table :learnedmoves do |t|
      t.integer :pokemon_id
      t.integer :level_learned
      t.integer :move_id

      t.timestamps

    end
  end
end
