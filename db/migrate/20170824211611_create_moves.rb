class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.text :effect

      t.timestamps

    end
  end
end
