class Client < ActiveRecord::Base
  has_one :person
  has_many :animals
end
