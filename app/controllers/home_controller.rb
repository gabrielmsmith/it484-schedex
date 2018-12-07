class HomeController < ApplicationController
  def index
    @currentEmp = Employee.where(:uid => session[:user_id])
  end
end
