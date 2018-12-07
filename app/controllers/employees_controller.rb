class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
        @currentEmp = Employee.where(:uid => session[:user_id])
    end
   
    def show
        id = params[:id]
        @employee = Employee.find(id)
    end
    
    def new
        @employee = Employee.new
    end
    
    def edit
        id = params[:id]
        @employee = Employee.find(id)
    end
    
    def update
        @employee = Employee.find params[:id]
        previousType = @employee.employee_type
        params.require(:employee)
        permitted = params[:employee].permit(:address, :last_name, :first_name, :phone_number, :employee_type, :driver_id, :dob)
        @employee.update_attributes!(permitted)
        newType = @employee.employee_type
        if previousType != newType
            Shift.clear_shifts(@employee.id)
            Request.clear_requests(@employee.id)
        end
        flash[:success] = "#{@employee.first_name} was successfully updated."
        redirect_to employees_path
    end
    
    
    def create
        params.require(:employee)
        permitted = params[:employee].permit(:address, :last_name, :first_name, :phone_number, :employee_type, :driver_id, :dob)
        @employee = Employee.create!(permitted)
        if ! Employee.find_by(:uid => session[:user_id]) # Handling new account creation
            @employee.update_attributes(:uid => session[:user_id])
        end
        flash[:success] = "#{@employee.first_name} was successfully created."
        redirect_to employees_path
    end
    
    def employee_params
        params.require(:employee).permit(:address, :last_name, :first_name, :phone_number, :employee_type, :driver_id, :dob)
    end
    
    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        flash[:warning] = "#{@employee.first_name} has been deleted"
        redirect_to employees_path
    end
end