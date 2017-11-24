class Customer < ApplicationRecord
  belongs_to :region
  has_many :orders
  belongs_to :user

  scope :with_orders, -> { joins(:orders).distinct }
end
