class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :require_no_authentication, only: [:cancel]
  before_action :authenticate_scope!, :only => [:new]

  protected
  def after_sign_up_path_for(resource)
    session[:new_user] = User.last.id
    flash.delete(:notice)

    new_customer_path
  end

  private
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
