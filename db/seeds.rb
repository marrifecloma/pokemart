require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 AdminUser.create!(email: 'admin@pokemart.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

CSVFiles = ['categories', 'products']

CSVFiles.each do |csv|
  CSV.foreach('db/csv/' + csv + '.csv', { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    if csv == 'categories'
      Category.create(row.to_hash)
    elsif csv == 'products'
      productInfo = row.to_hash

      category = Category.where('name = ?', productInfo[:category_name]).first

      category.products.build(:name => productInfo[:name],
                              :description =>productInfo[:description],
                              :price => productInfo[:price].to_f,
                              :stock_quantity => productInfo[:stock_quantity].to_i,
                              :image_name => productInfo[:image_name]).save
    end
  end
end
