class Restaurant < ApplicationRecord
  # belongs_to :admin_user
  has_many :foods
end
