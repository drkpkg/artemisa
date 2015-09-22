class Person < ActiveRecord::Base
  belongs_to :client
  belongs_to :employee
  has_one :user
end
