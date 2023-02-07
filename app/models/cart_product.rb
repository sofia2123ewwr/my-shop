class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

   # LOGIC
   def total_price
    self.quantity * self.product.price
  end
end
