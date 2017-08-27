class CreatePoketypes < ActiveRecord::Migration[5.0]
  def change
    create_table :poketypes do |t|
      t.integer :pokemon_id
      t.integer :type_id

      t.timestamps

    end
  end
end
