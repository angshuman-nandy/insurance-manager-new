class User < ApplicationRecord


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_ADDRESS_REGEX = /\A[a-zA-Z0-9, .]*\z/


  before_save { self.email = email.downcase }

  has_secure_password

  validates :email, presence: true
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates_confirmation_of :password
  validates_presence_of :password_confirmation
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact_number,presence: true, numericality: {only_integer: true}, length: { is: 10 , message: "length should be 10"} 
  validates :address, format: { with: VALID_ADDRESS_REGEX, message: "only letters numbers \",\" \".\" and space are allowed" }, presence: true

   
end
