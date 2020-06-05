class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render json: @products
  end

  def edit
    @product = Product.find_by(id: params[:id])
    puts "*"*50
    p @product.inspect
    puts "*"*50
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def create
    @product = Product.create( name: params[:name], description: params[:description])
    redirect_to '/products'
  end

  private

  
end
