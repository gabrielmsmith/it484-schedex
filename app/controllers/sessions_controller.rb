class SessionsController < ApplicationController
  layout false
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user
  def create
    auth=request.env["omniauth.auth"]
    user=User.find_by(:provider => auth["provider"], :uid => auth["uid"]) ||   # changed where to find_by
      User.create_with_omniauth(auth)
    session[:user_id] = user.id
    
    if Employee.find_by(:uid => user.id)
      redirect_to employees_path
      flash[:success] = 'You have signed in!'
    else
      redirect_to new_employee_path
    end
    
  end
  def destroy
    session.delete(:user_id)
    flash[:warning] = 'Logged out successfully.'
    redirect_to employees_path
  end
  
  def index
  end
end