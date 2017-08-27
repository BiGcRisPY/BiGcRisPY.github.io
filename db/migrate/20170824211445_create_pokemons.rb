class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :creature
      t.string :evo_level
      t.string :evo_outcome
      t.string :image

      t.timestamps

    end
  end
end
