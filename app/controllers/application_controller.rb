class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?


  def authenticate
    redirect_to login_path, alert: "Please log in first." unless signed_in?
  end

  def ensure_not_signed_in
    if(signed_in?)
      redirect_to root_path, alert: "You are already signed in, the page you were trying to access is accessible to anonymous users only. You may logout and try again."
    end
  end

  def signed_in?
    current_user ? true : false
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
