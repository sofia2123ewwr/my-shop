class Product < ApplicationRecord
  belongs_to :category
  # has_many :orders, through: :order_products
  has_many :cart_products
end
