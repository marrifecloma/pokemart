class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.decimal :total

      t.timestamps
    end
  end
end
