class CartsController < ApplicationController
  def show
    @cart = @current_cart
  end

  # def destroy
  #   @cart.destroy
  #   session[:cart_id] = nil
  #   redirect_to root_path
  # end
end
