class ProductsController < ApplicationController
  def show_all
    @products = if params[:search_term]
                  search(params[:search_term], 'all')
                else
                  Product.where('stock_quantity > 0')
                         .paginate(page: params[:page], per_page: 9)
                         .order(:category_id).order(:name)
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def category_show
    @category_name = params[:name]

    @products = if params[:search_term]
                  search(params[:search_term], 'category')
                else
                  Category.find_by(name: params[:name])
                          .product
                          .paginate(page: params[:page], per_page: 9)
                end
  end

  def search(term, product_page_type)
    if product_page_type == 'all'
      Product.where('name LIKE ?', "%#{term}%")
             .paginate(page: params[:page], per_page: 9)
    elsif product_page_type == 'category'
      Category.find_by(name: params[:name])
              .products
              .where('name LIKE ?', "%#{term}%")
              .paginate(page: params[:page], per_page: 9)
    end
  end
end
