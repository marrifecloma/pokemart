class FixFKcart < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:carts, :customer, index: true, foreign_key: true)

    add_reference :carts, :user, foreign_key: true
  end
end
