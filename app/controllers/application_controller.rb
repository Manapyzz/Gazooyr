class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_last_gazooies
  before_action :new_gazooy

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:username, :email, :password, :password_confirmation, :current_password)}
  end

  def get_last_gazooies
    @last_gazooies = Gazooy.limit(5).order('id desc')
  end

  def new_gazooy
    @new_gazooy = Gazooy.new
  end
end
