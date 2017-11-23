class Customer < ApplicationRecord
  belongs_to :region
  has_many :orders
end
