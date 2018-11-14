class RequestsController < ApplicationController
    def index
        @employees = Employee.all
    end
    
    def new
        @request = Request.new
        @employees = Employee.all
        @shifts = Shift.all
    end
    
    def create
        params.require(:request)
        permitted = params[:request].permit(:emp_sender_id, :emp_receiver_id, :shift_id, :comment)
        @request = current_user.Request.create!(permitted)
        flash[:notice] = "Shift request created successfully."
        redirect_to requests_path
    end
    
    def request_params
        params.require(:employee).permit(:emp_sender_id, :emp_receiver_id, :shift_id, :comment)
    end
    
    def show
        id = params[:id]
        @requests = Employee.find(id).requests
    end
end