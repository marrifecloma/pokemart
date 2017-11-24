class ChargesController < ApplicationController
  after_action :delete_session, only: %i[create]
  before_action :create_stripe_customer, only: %i[create]
  before_action :create_stripe_charge, only: %i[create]

  def new; end

  def create
    create_order if @charge.paid && (session[:amount].to_f * 100).to_i == @charge.amount
  end

  private

  def create_stripe_customer
    @customer = Stripe::Customer.create(email: params[:stripeEmail],
                                        source: params[:stripeToken])
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def create_stripe_charge
    @charge = Stripe::Charge.create(customer: @customer.id,
                                    amount: (session[:amount].to_f * 100).to_i,
                                    description: 'Rails Stripe customer',
                                    currency: 'cad')
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def create_order
    @order = Order.create(status_id: 1,
                          total: session[:amount],
                          stripe_id: @charge.id,
                          customer_id: session[:customer])

    save_cart_items(Cart.find(session[:cart_id]).cart_items)

    update_cart_status
  end

  def save_cart_items(cart_items)
    cart_items.each do |item|
      @order.order_products.build(quantity: item.quantity,
                                  price: item.product.price,
                                  product_id: item.product.id).save

      update_stock_quantity(item.product.id, item.quantity)
    end
  end

  def update_stock_quantity(product_id, quantity)
    product = Product.find(product_id)
    product.stock_quantity = product.stock_quantity - quantity
    product.save
  end

  def update_cart_status
    cart = Cart.find(session[:cart_id])
    cart.ordered = 1
    cart.save
  end

  def delete_session
    session.delete(:cart_id)
    session.delete(:amount)
    session.delete(:customer)
  end
end
