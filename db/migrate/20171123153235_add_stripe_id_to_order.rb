class AddStripeIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :stripe_id, :string
  end
end
