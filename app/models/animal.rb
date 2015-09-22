class Animal < ActiveRecord::Base
  belongs_to :client
  belongs_to :specie, dependent: destroy
  belongs_to :medical_record
end
