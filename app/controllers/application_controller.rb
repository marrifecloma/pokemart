class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_tax(r)
    tax = 0.0

    tax += r.gst if r.gst

    tax += r.pst if r.pst

    tax += r.hst if r.hst

    (tax / 100)
  end

  protected

  def after_sign_in_path_for(*)
    cart_session = Cart.where(['user_id = ? AND ordered = 0', current_user.id]).last
    flash.delete(:notice)

    session[:cart_id] = cart_session.id unless cart_session.nil?

    root_path
  end
end
