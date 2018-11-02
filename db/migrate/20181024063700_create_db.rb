class CreateDb < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      
      # Creating the association for employees to shifts
      t.string 'address'
      t.string 'first_name'
      t.string 'last_name'
      t.string 'phone_number'
      
      # employee type specifies if an employee is a manager,
      # in-store, or a driver
      t.string 'employee_type'
      
      # driver_id specifies the driver's licnese number for drivers
      t.string 'driver_id'
      t.datetime 'dob'
    end
    
    create_table :shifts do |t|
      t.references 'emp_id'
      
      # If shift is on Monday, Tuesday, etc
      t.string 'day'
      
      # Determines which types of employees can work a shift
      t.string 'shift_type'
      
      # Speficied lunch or dinner shifts
      t.string 'time'
    end
    
    create_table :requests do |t|
      # The employee making the request
      t.references 'emp_sender_id'
      
      # The employee receiving the request
      t.references 'emp_receiver_id'
      
      # The shift in question
      t.references 'shift_id'
      
      t.text 'comment'
    end
  end
end
