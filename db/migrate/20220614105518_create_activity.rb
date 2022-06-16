class CreateActivity < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.integer :wave_height
      t.integer :wind
      t.string :flag
      t.integer :period
      t.string :wind_direction
      t.string :wave_direction
      t.integer :min_score
      t.datetime :date_time_start
      t.datetime :date_time_end
      t.string :tips
      t.references :spot, null: false, foreign_key: true
      t.timestamps
    end
  end
end
