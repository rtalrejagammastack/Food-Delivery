class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_one :cart
  # has_many :cart_items, through: :cart
  has_one :cart
  has_many :orders
  has_many :addresses
  # belongs_to :default_address, class_name: 'Address', optional: true
  # has_many :cart_items, through: :carts

  before_save :downcase_email

  validates :first_name, :last_name, presence: :true

  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  after_create :create_cart

  def create_cart
    build_cart.save
      # Cart.create(user: self)
  end
        
  private
    
    def downcase_email
      self.email = email.downcase
    end

end
