class OrdersController < ApplicationController
  before_action :validate_current_cart, only: [:new, :create]

  # def index
  #   @orders = collection
  # end

  # def show
  #   @order = resource
  # end

  def create
    @order = Order.new(user_id: current_user&.id)
    @order.build_order_detail(order_detail_params)
    @order.order_detail.build_address(address_params)
    @current_cart.cart_products.each do |cart_product|
      @order.product_orders.new(product_id: cart_product.product_id, quantity: cart_product.quantity)
    end

    if @order.save
      clear_cart
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @order = Order.new
    @order.build_order_detail
    @order.order_detail.build_address
  end

  private

  def validate_current_cart
    if is_cart_empty?
      flash[:error] = "Your cart is empty"
      redirect_to root_path
    end
  end

  def is_cart_empty?
    @current_cart.cart_products.empty?
  end

  # def collection
  #   current_user.orders
  # end

  # def resource
  #   collection.find(params[:id])
  # end

  def order_detail_params
    params[:order]
      .require(:order_detail)
      .permit(:first_name, :last_name, :email)
  end

  def address_params
    params[:order][:order_detail]
      .require(:address)
      .permit(:country, :city, :street, :comment)
  end

  def clear_cart
    @current_cart.clear
  end
end
