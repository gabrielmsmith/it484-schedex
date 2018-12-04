class Employee < ActiveRecord::Base
    has_many :shifts
    has_many :requests
    belongs_to :user
    
    def self.get_name(id)
        if Employee.find_by_id(id)
            return Employee.find_by_id(id).first_name + ' ' + Employee.find_by_id(id).last_name
        else
            return "No Employee found."
        end
    end
end