class Shift < ActiveRecord::Base
    has_many :requests
    belongs_to :employees
    
    def self.get_shifts(type, time)
        shifts = Array.new(0)
        Shift.all.each do |shift|
            if shift.shift_type.eql?(type) and shift.time.eql?(time)
               shifts.push(shift)
            end
        end
        return shifts
    end
    
    def self.get_employee_name(id)
        if Employee.find_by_id(id)
            return Employee.find_by_id(id).first_name + ' ' + Employee.find_by_id(id).last_name
        else
            return "Open Shift"
        end
    end
    
    def self.get_employees_available(day, time)
        employees = Array.new(0)
        Employee.all.each do |emp|
            available = true
            Shift.all.each do |shift|
                if shift.day.eql?(day) and shift.time.eql?(time)
                    if shift.emp_id.eql?(emp.id.to_s())
                       available = false
                    end
                end
            end
            if available
                employees.push(emp)
            end
        end
        return employees
    end
    
end