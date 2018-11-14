class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
   
    def show
        id = params[:id]
        @employee = Employee.find(id)
    end
    
    def new
        @employee = Employee.new
    end
    
    def create
        params.require(:employee)
        permitted = params[:employee].permit(:address, :last_name, :first_name, :phone_number, :employee_type, :driver_id, :dob)
        @employee = Employee.create!(permitted)
        if ! Employee.find_by(:uid => session[:user_id]) # Handling new account creation
            @employee.update_attributes(:uid => session[:user_id])
        end
        flash[:notice] = "#{@employee.first_name} was successfully created."
        redirect_to employees_path
    end
    
    def employee_params
        params.require(:employee).permit(:address, :last_name, :first_name, :phone_number, :employee_type, :driver_id, :dob)
    end
    
    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        flash[:notice] = "#{@employee.first_name} has been deleted"
        redirect_to employees_path
    end
end