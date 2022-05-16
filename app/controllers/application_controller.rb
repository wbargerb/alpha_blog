class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? 
  def home
    render html: 'this is home!!!'
  end

  def about
    render html: 'This is about'
  end

 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?           
      flash[:alert] = "You need to be logged in for that!!!"
      redirect_to login_path
    end
  end
end
