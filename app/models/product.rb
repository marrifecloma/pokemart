class Product < ApplicationRecord
  belongs_to :category

  mount_uploader :image_name, ImageUploader

  validates :name, :price, :stock_quantity, presence: true
end
