class CreateMytms < ActiveRecord::Migration[5.0]
  def change
    create_table :mytms do |t|
      t.integer :tm_id

      t.timestamps

    end
  end
end
