# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super
    if session[:cart_id].present?
      session_cart = Cart.find_by(id: session[:cart_id])
      if session_cart.present?
        session_cart.update(user: current_user)
        session.delete(:cart_id)
      end
    end
  end
end
