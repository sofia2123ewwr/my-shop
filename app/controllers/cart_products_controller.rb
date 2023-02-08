class CartProductsController < ApplicationController
  def create
    # Find associated product and current cart
    chosen_product = Product.find(params[:product_id])

    # If cart already has this product then find the relevant cart_product and iterate quantity otherwise create a new cart_product for this product
    if @current_cart.products.include?(chosen_product)
      # Find the cart_product with the chosen_product
      @cart_product = @current_cart.cart_products.find_by(:product_id => chosen_product)
      # Iterate the cart_product's quantity by one
      @cart_product.quantity += 1
    else
      @cart_product = CartProduct.new(cart: @current_cart,
                                      product: chosen_product,
                                      quantity: 1)

    end
    # Save and redirect to cart show path
    @cart_product.save
    # redirect_to cart_path(@current_cart)
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
