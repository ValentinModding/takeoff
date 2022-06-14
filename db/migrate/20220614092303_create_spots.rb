class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
