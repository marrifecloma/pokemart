class CustomersController < ApplicationController
  def new

    if request.post?
      @customer = Customer.new(full_name: params[:full_name],
                               address: params[:address],
                               city: params[:city],
                               region_id: params[:region][:region_id],
                               user_id: session[:new_user])
     if @customer.save
       session.delete(:new_user)

       redirect_to user_session_path
     else
       flash[:error] = 'Error'
     end
    end
  end

  def customer_info
    @customer_info = Customer.where(full_name: params[:full_name],
                                    address: params[:address],
                                    city: params[:city],
                                    region_id: params[:region][:region_id]).first_or_create!

    session[:customer] = @customer_info.id

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
