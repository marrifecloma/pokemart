class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

  protected
  def after_sign_in_path_for(resource)
    cart_session = Cart.where(["user_id = ? AND ordered = 0", current_user.id]).last

    if cart_session != nil
      session[:cart_id] = cart_session.id
    end

    root_path
  end
end
