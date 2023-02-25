class CategoriesController < ApplicationController

  def show
    @category = resource
    @categories = collection
  end

  private
  def collection
    Category.sort_position
  end

  def resource
    collection.find(params[:id])
  end

end
