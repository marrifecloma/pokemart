class ChangeDbInfo < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :country

    rename_table :provinces, :regions 
  end
end
