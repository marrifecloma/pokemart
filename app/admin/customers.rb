ActiveAdmin.register Customer do

  scope :with_orders

  index do
    selectable_column
    id_column
    column :full_name
    column :address
    column :city
    column :region
    actions
  end

  show do
    panel 'Orders' do
      customer.orders.each do |order|
        attributes_table_for order do
          row :id
          row :total
          row :status
        end

        panel 'Items' do
          order.order_products.each do |p|
            table_for p.product do
              column :id
              column :name
              column :price
            end
          end
          # order.order_products.first.product.name
        end
      end
    end
    default_main_content
  end
end
