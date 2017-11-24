class ChargesController < ApplicationController
  def new
  end

  def create
    amount = session[:amount]

    cart_items = Cart.find(session[:cart_id]).cart_items

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

  @charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (amount.to_f * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )

  if @charge.paid && (amount.to_f * 100).to_i == @charge.amount
    @order = Order.create(status_id: 1, total: amount, stripe_id: @charge.id, customer_id: session[:customer])

    cart_items.each do |item|
      @order.order_products.build(quantity: item.quantity, price: item.product.price, product_id: item.product.id).save

      product = Product.find(item.product.id)
      product.stock_quantity = product.stock_quantity - item.quantity
      product.save
    end

    cart = Cart.find(session[:cart_id])
    cart.ordered = 1
    cart.save

    session.delete(:cart_id)
    session.delete(:amount)
    session.delete(:customer)
  end



rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end
end
