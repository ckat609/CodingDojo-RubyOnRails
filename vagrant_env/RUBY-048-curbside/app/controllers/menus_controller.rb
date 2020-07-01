class MenusController < ApplicationController
  def index
    @menus = Menu.where(restaurant: current_user.restaurants).order(:name)
    @restaurants = Restaurant.where(user: current_user)
  end
  
  def new
    @menus = Menu.where(restaurant: current_user.restaurants).order(:name)
    @restaurants = Restaurant.where(user: current_user)
  end
  
  def create
    aMenu = Menu.new()
    aMenu.name = menu_params[:name]
    aMenu.restaurant = Restaurant.find(menu_params[:restaurant])
    
    if aMenu.save
      flash[:notices] = ["Menu #{aMenu.name} created successfully!"]
      redirect_to menus_new_path
    else
      flash[:errors] = aMenu.errors.full_messages
      redirect_to menus_new_path
    end
    
  end
  
  def show
  end
  
  def edit
    @menu = Menu.find(params[:id])
    @menus = Menu.all.order(:name)
    @restaurants = Restaurant.where(user: current_user)
  end

  def update
    aMenu = Menu.find(params[:id])
    aMenu.name = menu_params[:name]

    if aMenu.save
      flash[:notices] = ["Menu #{aMenu.name} modified successfully!"]
      redirect_to menus_new_path
    else
      flash[:errors] = aMenu.errors.full_messages
      redirect_to menus_edit_path
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notices] = ["Menu #{@menu.name} removed successfully!"]
    redirect_to menus_new_path
  end

  def menu_params
    params.require(:menu).permit(:name, :restaurant)
  end
end
