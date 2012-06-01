class Category < ActiveRecord::Base
  
  attr_accessible :description, :title, :parent_id

  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :parent_id, :presence => true
  has_many :products

end
