class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    
    def new
        @employee = Employee.new
    end
    
    def create
        @employee = Employee.create!(employee_params)
        flash[:notice] = "#{@employee.first_name} was successfully created."
        redirect_to employee_path
    end
    
    def employee_params
        params.require(:employee).permit(:address, :last_name, :first_name, :phone_number, :emp_type, :driver_id, :dob)
    end
end