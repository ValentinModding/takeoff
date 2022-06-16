class AddNameTempWaterTempToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :name, :string
    add_column :activities, :temp, :integer
    add_column :activities, :water_temp, :integer
  end
end
