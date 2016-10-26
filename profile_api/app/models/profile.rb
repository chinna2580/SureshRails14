class Profile < ApplicationRecord
	#attr_accessor :user_name, :email,:fname
	before_save { email.downcase! }
	validates :user_name, presence: true,
	 		   uniqueness: { case_sensitive: true }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
	validates :fname, presence: true
	validates :lname, presence: true
	validates :password, presence: true, length: { minimum: 6 }
	validates :confirm_password, presence: true
	has_secure_password
end
