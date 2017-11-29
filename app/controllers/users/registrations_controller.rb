class Users::RegistrationsController < Devise::RegistrationsController
    prepend_before_action :require_no_authentication, only: [:cancel]

    protected

    def after_sign_up_path_for(*)
      session[:new_user] = User.last.id
      flash.delete(:notice)

      new_customer_path
    end

    private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
