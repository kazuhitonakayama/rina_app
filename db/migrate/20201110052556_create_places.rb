class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.date :day
      t.string :comment
      t.integer :genre_id
      t.string :image
      t.integer :rate

      t.timestamps
    end
  end
end
