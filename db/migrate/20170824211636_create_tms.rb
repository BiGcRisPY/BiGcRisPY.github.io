class CreateTms < ActiveRecord::Migration[5.0]
  def change
    create_table :tms do |t|
      t.integer :move_id

      t.timestamps

    end
  end
end
