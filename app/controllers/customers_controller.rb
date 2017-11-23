class CustomersController < ApplicationController
  def customer_info
    @customer_info = Customer.where(full_name: params[:full_name],
                                address: params[:address],
                                city: params[:city],
                                region_id: params[:region][:region_id]).first_or_create!

    @tax = getTax @customer_info.region

    @cart_items = Cart.find(session[:cart_id]).cart_items

    @description = 'Pokemart'
  end

  private
  def getTax region
    tax = 0.0

    if region.gst
      tax += region.gst
    end

    if region.pst
      tax += region.pst
    end

    if region.hst
      tax += region.hst
    end

    (tax / 100)
  end
end
