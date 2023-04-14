class Order < ApplicationRecord

  belongs_to :user
    # has_many :cart_items
    has_many :order_items, dependent: :destroy
    has_many :cart_items, through: :order_items
    # belongs_to :restaurant
    # belongs_to :address, optional: true

    # before_validation :set_address
 
    accepts_nested_attributes_for :cart_items
    
    # after_create :create_payment
    
    # validates :restaurant_id, presence: true
    # validates :default_address_id, presence: true

    enum status: [:pending, :inprogress, :complete]
    
    
    # def create_payment
    #     payement = Payment.new(order: self, user: user)
    #     payment.unpaid!
    # end
    
  
    # private
end
