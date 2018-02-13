class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_google_user

  def current_google_user
    @current_google_user ||= GoogleUser.find(session[:google_user_id]) if session[:google_user_id]
    rescue ActiveRecord::RecordNotFound
  end
end
