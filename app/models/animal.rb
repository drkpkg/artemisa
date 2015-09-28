class Animal < ActiveRecord::Base
  belongs_to :client
  has_one :breed, dependent: destroy
  belongs_to :medical_record
end
