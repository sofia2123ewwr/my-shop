class CartProductsController < ApplicationController

  def create
    chosen_product = Product.find(params[:product_id])
    if @current_cart.products.include?(chosen_product)
      @cart_product = @current_cart.cart_products.find_by(:product_id => chosen_product)
      @cart_product.quantity += 1
    else
      @cart_product = CartProduct.new(cart: @current_cart,
                                      product: chosen_product,
                                      quantity: 1)
    end

    @cart_product.save
    flash[:success] = "Product added to the cart"
    redirect_back(fallback_location: products_path)
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @cart_product = CartProduct.find(params[:id])
    @cart_product.quantity += 1
    @cart_product.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @cart_product = CartProduct.find(params[:id])
    @cart_product.quantity -= 1
    @cart_product.save
    if @cart_product.quantity == 0
      @cart_product.destroy
    end

    redirect_to cart_path(@current_cart)
  end

  private
    def cart_product_params
      params.require(:cart_product).permit(:quantity,:product_id, :cart_id)
    end
end
