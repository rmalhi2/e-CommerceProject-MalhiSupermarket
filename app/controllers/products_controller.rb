class ProductsController < ApplicationController
  def index
    @products = Product.search_by_keyword_and_category(params[:keyword], params[:category_id]).page(params[:page]).per(10) # Display 10 products per page
  end

  def show
    @product = Product.find(params[:id])
  end

  
end 
