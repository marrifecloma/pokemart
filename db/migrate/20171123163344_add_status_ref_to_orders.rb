class AddStatusRefToOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :status_id
    add_reference :orders, :status, foreign_key: true
  end
end
