class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  def sub_total
    sum = 0
    self.cart_products.each do |cart_product|
      sum+= cart_product.total_price
    end
    sum
  end

  def clear
    cart_products.destroy_all
  end
end
