class Product < ActiveRecord::Base
  attr_accessible :available, :description, :price, :title, :photo, :category_id

  has_attached_file :photo,
                    :styles => {
                      :small => "50x50>",
                      :thumbnail => "100x100",
                      :display => "150x150"
                    }
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 1.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'images/gif', 'images/jpeg']

  belongs_to :category, :foreign_key => :category_id

end
