class AddStatusToParticipation < ActiveRecord::Migration[6.1]
  def change
    add_column :participations, :status, :boolean, default: false
  end
end
