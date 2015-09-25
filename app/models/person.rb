class Person < ActiveRecord::Base
  belongs_to :client
  belongs_to :employee
  belongs_to :user
end
