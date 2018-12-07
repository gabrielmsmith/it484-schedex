class Request < ActiveRecord::Base
    belongs_to :employee
    belongs_to :shift
    
    def self.destroy_request(shift)
        requests = Request.where(:shift_id => shift.id)
        if requests
            requests.each do |req|
                destroy(req.id)
            end
        end
    end
    
    def self.clear_requests(emp_id)
        sentRequests = Request.where(:emp_sender_id => emp_id)
        if sentRequests
            sentRequests.each do |req|
               destroy(req.id)
            end
        end

        receivedRequests = Request.where(:emp_receiver_id => emp_id)
        if receivedRequests
            receivedRequests.each do |req|
               destroy(req.id)
            end
        end
    end
    
    def self.already_requested(shift)
        requests = Request.where(:shift_id => shift.id)
        employees = Array.new(0)
        
        if requests
            requests.each do |req|
               employees.push(Employee.find_by_id(req.emp_receiver_id))
            end
        end
        return employees
    end
    
    def self.get_requests(emp_id)
        requests = Request.where(:emp_receiver_id => emp_id)
        requests_list = Array.new(0)
        
        if requests
            requests.each do |req|
                requests_list.push(req)
            end
        end
        return requests_list
    end
end