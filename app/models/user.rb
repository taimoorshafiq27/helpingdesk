class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true
end
