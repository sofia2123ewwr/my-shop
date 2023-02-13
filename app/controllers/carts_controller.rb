class CartsController < ApplicationController

  def show
    @cart_products = @current_cart.cart_products.includes(:product)
    @cart_sub_total = @current_cart.sub_total
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  # def create
  #   cart = Cart.new
  #   # add cart product


  #   cart.save


  #   session[:cart_id] = @current_cart.id

  # end
end
