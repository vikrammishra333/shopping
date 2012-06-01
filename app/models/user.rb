class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :gender, :username, :newsletter
  # attr_accessible :title, :body
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true, :uniqueness => true

  belongs_to :role, :foreign_key => :role_id



  # check if current user is admin and return true
  # if not return false 
  def check_admin?
    if not self.role.nil?
      if self.role.title == 'admin'
        true
      else
        false
      end
    else
      false
    end
  end

end
