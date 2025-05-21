class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true

  has_many :user_roles
  has_many :roles, through: :user_roles

  private

  def administrator?
    roles.exists?(name: "Administrator")
  end
end
