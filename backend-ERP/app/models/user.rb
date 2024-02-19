class User < ApplicationRecord
   
    has_secure_password :bcrypt
  
    has_many :orders, dependent: :destroy
  
    validates :email, presence: true, uniqueness: true 
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :username, presence: true, uniqueness: true
    validates :password_digest, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  
    # Consider adding attributes like first_name, last_name, etc.
  
    # Consider implementing roles and permissions
  
    # timestamps are automatically added by Rails
  
    # Add comments and documentation for clarity
  end
  