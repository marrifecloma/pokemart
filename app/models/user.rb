class User < ApplicationRecord
  has_one :customer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
