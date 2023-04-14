class Payment < ApplicationRecord
  belongs_to :user
    belongs_to :order
  
    enum status: [:unpaid, :paid, :failed]

    validates :card_number, presence: true, length: { minimum: 15, maximum: 16 }
    validates :expiration_month, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
    validates :expiration_year, presence: true, numericality: { greater_than_or_equal_to: Date.today.year, less_than_or_equal_to: Date.today.year + 10 }
    validates :cvc, presence: true, length: { minimum: 3, maximum: 4 }
end
