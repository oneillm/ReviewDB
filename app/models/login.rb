class Login < ActiveRecord::Base
    validates_presence_of :firstname
    validates_presence_of :lastname
    validates_presence_of :username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:registerable,
#  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  #attri_accessible :username, :email, :password, :password_confirmation
  has_many :socialmediasites

  scope :without_login, lambda{|login| login ? {:conditions => ["logins.id != ?", login.id]} : {}}
   def to_param #overriden to_param in system
      "#{id}-#{username}"            #use username instead of number e.g. 1
   end
   def self.search(search)
      if search
         find(:all, :conditions => ['LOWER(username) like ? OR LOWER(firstname Like ? OR LOWER(lastname like ?', "%#{search.downcase}%","%#{search.downcase}%", "%#{search.downcase}%"])
     else
         self.order(:username).all
      end
   end


end
