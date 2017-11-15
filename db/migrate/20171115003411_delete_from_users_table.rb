class DeleteFromUsersTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :address
    remove_column :users, :city
    remove_column :users, :country
  end
end
