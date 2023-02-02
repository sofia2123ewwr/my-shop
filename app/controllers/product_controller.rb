class ProductController < ApplicationController
    def index
        @product = Product.all 
    end 
end
