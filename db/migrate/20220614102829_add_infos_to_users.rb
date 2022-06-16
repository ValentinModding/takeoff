class AddInfosToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :boolean
    add_column :users, :score, :integer
    add_column :users, :address, :string
    add_column :users, :age, :integer
  end
end
