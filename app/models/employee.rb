class Employee < ActiveRecord::Base
    has_many :shifts
    has_many :requests
    belongs_to :user
end