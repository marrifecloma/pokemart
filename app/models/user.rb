class User < ApplicationRecord
  has_one :customer
  has_many :carts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
