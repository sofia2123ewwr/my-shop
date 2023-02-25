class CartsController < ApplicationController
  def show
    @cart_products = @current_cart.cart_products.includes(:product)
    @cart_sub_total = @current_cart.sub_total
  end

  def add_to_cart
    chosen_product = Product.find(params[:product_id])
    if @current_cart.products.include?(chosen_product)
      cart_product = @current_cart.cart_products.find_by(product: chosen_product)
      cart_product.quantity += 1
      cart_product.save
    else
      @current_cart.cart_products.create(product: chosen_product, quantity: 1)
    end

    flash[:success] = "Product added to the cart"
    redirect_back(fallback_location: products_path)
  end

  def remove_from_cart
    cart_product = @current_cart.cart_products.find(params[:id])
    cart_product.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    cart_product = @current_cart.cart_products.find(params[:id])
    cart_product.quantity += 1
    cart_product.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    cart_product = @current_cart.cart_products.find(params[:id])
    cart_product.quantity -= 1
    cart_product.save
    if cart_product.quantity == 0 
      cart_product.destroy
    end

    redirect_to cart_path(@current_cart)
  end

  def empty_cart
    @current_cart.clear
    redirect_to root_path
  end
end

