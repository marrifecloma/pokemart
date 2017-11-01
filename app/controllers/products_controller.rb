class ProductsController < ApplicationController
  def show_all
  #  @products = Product.paginate(:page[:page], :per_page => 9).order(:category_id).order(:name)
    @products = Product.where('stock_quantity > 0').paginate(:page => params[:page], :per_page => 9).order(:category_id).order(:name)
  end

  def show
  end
end
