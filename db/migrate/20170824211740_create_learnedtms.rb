class CreateLearnedtms < ActiveRecord::Migration[5.0]
  def change
    create_table :learnedtms do |t|
      t.integer :pokemon_id
      t.integer :tm_id

      t.timestamps

    end
  end
end
