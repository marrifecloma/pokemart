class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :customers, :province_id, :region_id
  end
end
