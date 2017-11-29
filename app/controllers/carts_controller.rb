class CartsController < ApplicationController
  def show
    return if session[:cart_id].nil?

    @current_cart = Cart.find(session[:cart_id]).cart_items
  end

  def add_to_cart
    @current_cart = current_cart

    item = @current_cart.cart_items.find_by(product_id: params[:product_id])

    if item
      item.update_attributes(quantity: item.quantity + 1)
    else
      @current_cart.cart_items.build(product_id: params[:product_id],
                                     quantity: 1).save
    end

    return_page
  end

  def delete_from_cart
    CartItem.where(product_id: params[:product_id], cart_id: session[:cart_id]).first.destroy

    redirect_to show_cart_path
  end

  def update_cart_item
    current_cart_item = CartItem.where(product_id: params[:product_id],
                                       cart_id: session[:cart_id]).first

    current_cart_item.update_attributes(quantity: params[:quantity])

    redirect_back fallback_location: root_path
  end

  def preview_order
    if current_user
      @customer_info = current_user.customer

      @tax = get_tax @customer_info.region

      session[:customer] = @customer_info.id
    end

    @current_cart = Cart.find(session[:cart_id])
  end

  private

  def current_cart
    @current_cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @current_cart = if current_user
                      Cart.create(user_id: current_user.id, ordered: 0)
                    else
                      Cart.create(user_id: nil, ordered: 0)
                    end

    session[:cart_id] = @current_cart.id

    @current_cart
  end

  def return_page
    redirect_back fallback_location: root_path
  end
end
