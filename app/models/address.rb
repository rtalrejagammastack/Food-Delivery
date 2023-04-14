class Address < ApplicationRecord
  belongs_to :user
  scope :default, -> {where(default: true).limit(1)}
 
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :street, :city, :state, :pincode, :country, presence: true
 
  def full_address
    "#{street}, #{city}, #{state}, #{country}, #{pincode}".strip
  end 

  def name_with_email
    "#{name}(#{email})"
  end
end
