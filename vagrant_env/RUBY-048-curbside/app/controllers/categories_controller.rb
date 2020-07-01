class CategoriesController < ApplicationController
  def index
  end
  
  def new
    @categories = Category.all.order(:name)
  end

  def create
    aCategory = Category.new(category_params)
    if aCategory.save
      flash[:notices] = ["Category #{aCategory.name} created successfully!"]
      redirect_to categories_new_path
    else
      flash[:errors] = aCategory.errors.full_messages
      redirect_to categories_new_path
    end

  end

  def show
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all.order(:name)
  end

  def update
    aCategory = Category.find(params[:id])
    aCategory.name = category_params[:name]

    if aCategory.save
      flash[:notices] = ["Category #{aCategory.name} modified successfully!"]
      redirect_to categories_new_path
    else
      flash[:errors] = aCategory.errors.full_messages
      redirect_to categories_edit_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notices] = ["Category #{@category.name} removed successfully!"]
    redirect_to categories_new_path
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
