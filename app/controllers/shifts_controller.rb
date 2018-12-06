class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
  end
  
  def edit
    id = params[:id]
    @shift = Shift.find(id)
    @employees = Employee.all
  end
  
  def update
    @shift = Shift.find params[:id]
    params.require(:shift)
    permitted = params[:shift].permit(:emp_id)
    @shift.update_attributes!(permitted)
    flash[:info] = "#{Shift.get_employee_name(@shift.emp_id)} was assigned the shift."
    redirect_to shifts_path
  end
end
