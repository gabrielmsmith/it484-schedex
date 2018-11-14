class ApplicationController < ActionController::Base
  before_filter :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that the below query may return nil
    @current_user ||= User.find_by_id(session[:user_id])
    
    redirect_to signin_path and return unless @current_user
  end
  
  protect_from_forgery with: :exception
end
