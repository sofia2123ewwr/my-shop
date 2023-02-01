class ProductController < ApplicationController
    def show
        @product = Product.all 
    end 
end
