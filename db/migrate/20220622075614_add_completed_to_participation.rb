class AddCompletedToParticipation < ActiveRecord::Migration[6.1]
  def change
    add_column :participations, :completed, :boolean, default: false
  end
end
