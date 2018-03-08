class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_google_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_google_user
    @current_google_user ||= GoogleUser.find(session[:google_user_id]) if session[:google_user_id]
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name << :date_of_birth << :gender << :last_name
     devise_parameter_sanitizer.for(:account_update) << :name << :email << :gender << :date_of_birth << :last_name
  end

end
