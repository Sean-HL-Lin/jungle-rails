class User < ActiveRecord::Base

  has_secure_password
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true


  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    if user = User.find_by(email: email).authenticate(password)
      user
    else
      nil 
    end 
  end
end
