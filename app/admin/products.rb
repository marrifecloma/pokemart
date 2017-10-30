ActiveAdmin.register Product do
permit_params :name, :description, :price, :stock_quantity, :image_name, :category_id

end
