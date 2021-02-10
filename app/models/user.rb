class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  validates :email, uniqueness: { case_sensitive: false }
  validates_length_of :password, minimum:6

  
end
