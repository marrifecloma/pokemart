class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :cart_items

  mount_uploader :image_name, ImageUploader

  validates :name, :price, :stock_quantity, presence: true
end
