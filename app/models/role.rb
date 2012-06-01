class Role < ActiveRecord::Base

  attr_accessible :description, :title
  has_many :users
end
