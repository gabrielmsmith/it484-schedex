class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
    @currentEmp = Employee.where(:uid => session[:user_id])
  end
  
  def edit
    id = params[:id]
    @shift = Shift.find(id)
    @employees = Employee.all
  end
  
  def update
    @shift = Shift.find params[:id]
    @employee = Employee.where(:uid => session[:user_id])
    id = @employee.ids[0].to_s
    @shift.update_attribute(:emp_id, id)
    Request.destroy_request(@shift)
    flash[:warning] = "#{Shift.get_employee_name(@shift.emp_id)} was assigned the shift."
    redirect_to shifts_path
  end
end
