class ProductsController < ApplicationController
  def index
  #  @products = Product.paginate(:page[:page], :per_page => 9).order(:category_id).order(:name)
    @products = Product.paginate(:page => params[:page], :per_page => 9).order(:category_id).order(:name)
  end

  def show
  end
end
