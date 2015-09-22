class Employee < ActiveRecord::Base
  has_one :person
end
