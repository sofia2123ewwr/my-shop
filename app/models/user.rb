class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :nullify

  def link_cart_and_transfer_session_products(session_cart_id)
    if cart.present?
      session_cart = Cart.find_by(id: session_cart_id)
      if session_cart.present?
        session_cart.cart_products.each do |cart_product|
          if cart.products.include?(cart_product.product)
            cart_product_in_cart = cart.cart_products.find_by(product: cart_product.product)
            cart_product_in_cart.quantity += cart_product.quantity
            cart_product_in_cart.save
          else
            cart.cart_products.create(product: cart_product.product, quantity: cart_product.quantity)
          end
        end
        session_cart.destroy
      end
    else
      cart = Cart.find_by(id: session_cart_id)
      cart.user = self
      cart.save
    end
  end
end
