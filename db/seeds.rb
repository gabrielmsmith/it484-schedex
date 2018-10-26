# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Seed the DB with fake emp data.
more_employees = [
  {:address => '123 Street', :last_name => 'Beernink', :first_name => 'Nick', :phone_number => '712-209-3355', :employee_type => 'Driver', :driver_id => '805FJ897Y', :dob => '12-24-1991' },
  {:address => '123 Street', :last_name => 'Smith', :first_name => 'Gabriel', :phone_number => '507-559-9848', :employee_type => 'Manager', :driver_id => '', :dob => '11-10-1993' },
  {:address => '123 Street', :last_name => 'Ardolf', :first_name => 'Garret', :phone_number => '507-454-8925', :employee_type => 'In Shop', :driver_id => '', :dob => '9-12-1994' },
  {:address => '123 Street', :last_name => 'Klein', :first_name => 'Jeremy', :phone_number => '507-898-5264', :employee_type => 'Driver', :driver_id => '956LK993P', :dob => '1-02-1996' },
  {:address => '123 Street', :last_name => 'Colstrom', :first_name => 'Josh', :phone_number => '507-951-9634', :employee_type => 'In Shop', :driver_id => '', :dob => '3-22-1992' }
]

more_employees.each do |emp|
  Employee.create!(emp)
end