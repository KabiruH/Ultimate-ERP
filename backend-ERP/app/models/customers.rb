class Customers < ApplicationRecord
    # Authentication, if applicable
    has_secure_password
  
    # Validations
    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :name, presence: true
  
    # Relationships
    has_many :orders, dependent: :destroy
    has_many :addresses, dependent: :destroy
    has_many :subscriptions, dependent: :destroy
    
    # Customer fields
    enum industry: { manufacturing: 0, retail: 1, healthcare: 2 }
  
    # Other methods as needed
  end