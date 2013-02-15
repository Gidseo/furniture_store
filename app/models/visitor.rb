class Visitor < ActiveRecord::Base
  attr_accessible :email, :heard_from, :message, :name, :postcode, :telephone
end
