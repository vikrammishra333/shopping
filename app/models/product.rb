class Product < ActiveRecord::Base
  attr_accessible :available, :description, :price, :title
end
