class CreatePokedexes < ActiveRecord::Migration[5.0]
  def change
    create_table :pokedexes do |t|
      t.integer :pokemon_id
      t.string :nickname
      t.integer :current_level
      t.string :trainer_id

      t.timestamps

    end
  end
end
