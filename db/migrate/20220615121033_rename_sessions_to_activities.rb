class RenameSessionsToActivities < ActiveRecord::Migration[6.1]
  def change
    rename_table :sessions, :activities
  end
end
