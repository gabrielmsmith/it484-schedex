class Employee < ActiveRecord::Base
    has_many :shifts
    has_many :requests
end