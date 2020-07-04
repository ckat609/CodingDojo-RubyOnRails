class RestaurantsController < ApplicationController
  before_action :require_restaurant_edit_permissions, only:[:edit, :destroy]

  def index
  end

  def new
    @categories = Category.all.order(:name)
    @restaurants = Restaurant.where(user: current_user)
  end
  
  def create
    # aRestaurant = Restaurant.new(cuisine: Cuisine.find(1), name: restaurant_params[:name], user: current_user, address: restaurant_params[:address], city: restaurant_params[:city], state: restaurant_params[:state], zipcode: restaurant_params[:zipcode], description: restaurant_params[:description])
    aRestaurant = Restaurant.new
    aRestaurant.name = restaurant_params[:name]
    aRestaurant.category = Category.find(restaurant_params[:category])
    aRestaurant.address = restaurant_params[:address]
    aRestaurant.city = restaurant_params[:city]
    aRestaurant.state = restaurant_params[:state]
    aRestaurant.zipcode = restaurant_params[:zipcode]
    aRestaurant.description = restaurant_params[:description]
    aRestaurant.user = current_user
    
    
    if aRestaurant.save
      flash[:notices] = ["Restaurant #{aRestaurant.name} #{aRestaurant.address}, #{aRestaurant.city}, #{aRestaurant.state}, #{aRestaurant.zipcode}  created successfully!"]
      redirect_to restaurants_new_path
    else
      flash[:errors] = aRestaurant.errors.full_messages
      redirect_to restaurants_new_path
    end
  end
  
  def edit
    @categories = Category.all.order(:name)
    @restaurant = Restaurant.find(params[:id])
    @restaurants = Restaurant.where(user: current_user)
  end
  
  def update
    aRestaurant = Restaurant.find(params[:id])
    aRestaurant.name = restaurant_params[:name]
    aRestaurant.cuisine = Cuisine.find(restaurant_params[:cuisine])
    aRestaurant.address = restaurant_params[:address]
    aRestaurant.city = restaurant_params[:city]
    aRestaurant.state = restaurant_params[:state]
    aRestaurant.zipcode = restaurant_params[:zipcode]
    aRestaurant.description = restaurant_params[:description]
    # aRestaurant.user = current_user
    
    if aRestaurant.save
      flash[:notices] = ["Restaurant #{aRestaurant.name} #{aRestaurant.address}, #{aRestaurant.city}, #{aRestaurant.state}, #{aRestaurant.zipcode}  created successfully!"]
      redirect_to restaurants_new_path
    else
      flash[:errors] = aRestaurant.errors.full_messages
      redirect_to restaurants_new_path
    end
  end
  
  def destroy
    aRestaurant = Restaurant.find(params[:id])
    aRestaurant.destroy
    redirect_to restaurants_new_path
  end

  def show
    @API_KEY="AIzaSyBVcx5aK5IjGGrs2k3pJCiAtW2Y6T6C4Fs"
    @restaurant = Restaurant.find(params[:id])
    # @orders = User.find(session[:userid]).order_carts.count
  end

  
  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, :description, :category)
    end
end
