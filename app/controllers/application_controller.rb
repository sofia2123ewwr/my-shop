class ApplicationController < ActionController::Base
  before_action :initalize_cart

  def initalize_cart
    if user_signed_in?
      @cart = current_user.cart
    else
      if session[:cart_id].present?
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
  end
end
