class ApplicationController < ActionController::Base
  attr_accessor :current_cart

  def current_cart
    @current_cart ||= find_or_create_cart
  end

  private

  def find_or_create_cart
    if user_signed_in?
      current_user.cart || current_user.create_cart
    else
      session_cart || create_session_cart
    end
  end

  def session_cart
    Cart.find_by(id: session[:cart_id])
  end

  def create_session_cart
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
