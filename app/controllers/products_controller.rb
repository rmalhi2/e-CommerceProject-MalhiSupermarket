class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10) # Display 10 products per page
  end

  def show
    @product = Product.find(params[:id])
  end
end 
