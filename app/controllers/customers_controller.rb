class CustomersController < ApplicationController
  def new
    create_customer if request.post?
  end

  def customer_info
    @customer_info = if current_user
                       current_user.customer
                     else
                       find_or_create_customer(params[:full_name],
                                               params[:address],
                                               params[:city],
                                               params[:region][:region_id])
                     end

    customer_session
  end

  private

  def customer_session
    session[:customer] = @customer_info.id
  end

  def create_customer
    @customer = Customer.create(full_name: params[:full_name],
                                address: params[:address],
                                city: params[:city],
                                region_id: params[:region][:region_id],
                                user_id: session[:new_user])

    direct_to_login
  end

  def find_or_create_customer(full_name, address, city, region)
    Customer.where(full_name: full_name, address: address,
                   city: city, region_id: region,
                   user_id: nil).first_or_create!
  end

  def direct_to_login
    session.delete(:new_user)
    redirect_to user_session_path
  end
end
