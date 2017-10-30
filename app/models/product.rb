class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, :stock_quantity, presence: true
end
