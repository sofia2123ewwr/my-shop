class ProductsController < ApplicationController
  def index
    @categories = category_resource
    @products = resource
  end

  private
  def category_resource
    Category.sort_position
  end

  def resource
    Product.all
  end
end
