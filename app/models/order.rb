class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders
  has_one :order_detail, dependent: :destroy
  has_one :address, through: :order_detail

  attr_accessor :sub_total

  def calculate_sub_total
    product_orders.sum { |po| po.quantity * po.product.price }
  end
 
  def save_with_sub_total
    calculate_sub_total
    save
  end
end
