class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role_id, :first_name, :last_name, :email, :password, :password_confirmation, :current_password])
  end
end
