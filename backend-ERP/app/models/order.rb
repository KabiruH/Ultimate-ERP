class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  has_many :order_items
  
    enum status: { pending: 0, confirmed: 1, shipped: 2, completed: 3, cancelled: 4 }
  
    validates :customer_id, presence: true
    validates :total_amount, presence: true, numericality: { greater_than: 0 }
  
    # Other methods as needed (e.g., calculate total amount based on order items)
end
  

