class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
