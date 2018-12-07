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
    
    def self.get_details(id)
        if Shift.find_by_id(id)
            return Shift.find_by_id(id).shift_type + ': ' + Shift.find_by_id(id).day + ' ' + Shift.find_by_id(id).time
        end
    end
    
    def self.get_employee_name(id)
        if Employee.find_by_id(id)
            return Employee.find_by_id(id).first_name + ' ' + Employee.find_by_id(id).last_name
        else
            return "Open Shift"
        end
    end
    
    def self.get_employees_available(shift)
        day = shift.day
        time = shift.time
        employees = Array.new(0)
        Employee.all.each do |emp|
            available = true
            Shift.all.each do |sft|
                if sft.day.eql?(day) and sft.time.eql?(time)
                    if sft.emp_id.eql?(emp.id.to_s())
                       available = false
                    end
                end
            end
            if available and emp.employee_type[0].eql?(shift.shift_type[0]) 
                employees.push(emp)
            end
        end
        return employees
    end
    
    def self.employee_available?(emp_id, shift)
        available = true
        shifts = Shift.where(:day => shift.day, :time => shift.time)
        shifts.each do |sft|
            if sft.emp_id.eql?(emp_id.to_s())
                available = false
            end
        end
        return available
    end
    
    def self.employee_qualified?(emp_id, shift)
        return Employee.find_by_id(emp_id).employee_type.to_s()[0].eql?(shift.shift_type.to_s()[0])
    end
    
    def self.clear_shifts(emp_id)
        shifts = Shift.where(:emp_id => emp_id)
        shifts.each do |sft|
           sft.update_attributes(:emp_id => 0) 
        end
    end
    
    def self.get_my_shifts(emp_id, time)
        shifts = Array.new(0)
        allShifts = Shift.where(:emp_id => emp_id)
        if allShifts
            allShifts.each do |shift|
                if shift.time.eql?(time)
                   shifts.push(shift)
                end
            end
        end
        return shifts
    end
end