class CartsController < ApplicationController
  def show
    if session[:cart_id]
      @current_cart = Cart.find(session[:cart_id]).cart_items
    end
  end

  def add_to_cart
    @current_cart = current_cart

    product = Product.find(params[:product_id])

    item = @current_cart.cart_items.find_by(product_id: params[:product_id])

    if item
      item.quantity = item.quantity + 1
      item.save
    else
      cart_item = @current_cart.cart_items.build(product_id: params[:product_id],
                                                 quantity: 1)
      cart_item.save
    end

    redirect_to show_cart_path
  end

  private
  def current_cart
    @current_cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id

    @current_cart
  end
end
