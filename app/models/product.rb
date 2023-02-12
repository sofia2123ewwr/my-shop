class Product < ApplicationRecord
  belongs_to :category
  belongs_to :orders, dependent: :destroy
  has_many :cart_products
  has_many :product_orders, dependent: :destroy
end
