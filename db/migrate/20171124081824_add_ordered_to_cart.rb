class AddOrderedToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :ordered, :int, default: 0
  end
end
