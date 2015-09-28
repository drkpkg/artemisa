class Employee < ActiveRecord::Base
  has_one :person
  has_one :type_employee
end
