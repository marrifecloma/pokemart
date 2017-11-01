ActiveAdmin.register Product do
permit_params :name,
              :description,
              :price,
              :stock_quantity,
              :image_name,
              :category_id,
              datacenters_attributes: [:image_name, :_destroy]

def remove_image_name
  puts "Clicked"
end

form do |f|

    def remove_image_name
      product = Product.find_by_id(params[:product_id])


    end

  inputs do
    input :category
    input :name
    input :description
    input :price
    input :stock_quantity

    inputs :multipart => true do
      if(controller.action_name == 'edit')
        input :image_name, :as => :file,
              :hint => image_tag(f.object.image_name.url)
      else
        input :image_name, :as => :file
      end
      
      input :image_name_cache, :as => :hidden
      input :remove_image_name, :as => :boolean, :label => 'Remove', method: :remove_image_name
    end
  end
  f.actions
end
end
