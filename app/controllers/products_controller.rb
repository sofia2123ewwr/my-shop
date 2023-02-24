class ProductsController < ApplicationController
  def index
    @categories = category_resource
    @products = collection
  end
  
  private
  
  def category_resource
    Category.sort_position
  end

  def collection
    Product.all
  end
end
