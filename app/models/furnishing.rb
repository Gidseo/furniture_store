class Furnishing < ActiveRecord::Base
  attr_accessible :alter, :description, :dimensions_description, :img, :is_main, :name, :seats, :shape
end
