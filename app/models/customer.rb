class Customer < ApplicationRecord
  belongs_to :region
  has_many :orders

  scope :with_orders, -> { joins(:orders).distinct }
end
