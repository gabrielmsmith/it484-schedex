class RequestsController < ApplicationController
    def index
        @employee = Employee.where(:uid => session[:user_id])
        @receivedRequests = Request.where(:emp_receiver_id => @employee.ids[0])
        @sentRequests = Request.where(:emp_sender_id => @employee.ids[0])
    end
    
    def new
        @request = Request.new
        @currentEmp = Employee.where(:uid => session[:user_id])
        @employees = Employee.where.not(id: @currentEmp.ids[0])
        @currentShift = Shift.find params[:format]
    end
    
    def create
        params.require(:request)
        permitted = params[:request].permit(:emp_receiver_id, :shift_id, :comment)
        @employee = Employee.where(:uid => session[:user_id])
        @request = Request.create!(permitted).update_columns(:emp_sender_id => @employee.ids[0])
        flash[:success] = "Shift request created successfully."
        redirect_to requests_path
    end
    
    def request_params
        params.require(:employee).permit(:emp_receiver_id, :shift_id, :comment)
    end
    
    def show
        id = params[:id]
        @requests = Employee.find(id).requests
    end
    
    def destroy
        @request = Request.find(params[:id])
        @request.destroy
        flash[:info] = "Request has been deleted"
        redirect_to employees_path
    end
end