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


#  def self.find_by_email_or_username (email, username)
#    user = self.where("email = ? OR username = ?", email, username)
#    return user
#  end
#
  def self.check_email(auth)
    user = self.where("email = ? OR username = ?", auth.extra.raw_info.email, auth.extra.raw_info.username)

    first_name = auth.extra.raw_info.first_name+' '+auth.extra.raw_info.middle_name
    
    if user.empty? || user.nil?
      user = User.create!(:email => auth.extra.raw_info.email, :username => auth.extra.raw_info.username, :first_name => first_name,
             :last_name => auth.extra.raw_info.last_name, :gender => auth.extra.raw_info.gender)
    end

    return user

  end

end
