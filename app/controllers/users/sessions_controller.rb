# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super

    link_cart_to_user if session[:cart_id].present?
  end

  private

  def link_cart_to_user
    cart = Cart.find(session[:cart_id])
    cart.update(user: current_user)
  end
end
