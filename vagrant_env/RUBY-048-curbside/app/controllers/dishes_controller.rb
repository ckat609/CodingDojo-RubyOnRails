class DishesController < ApplicationController
  def index
  end

  def new
    @menu = Menu.find(params[:id])
    # @restaurant = Restaurant.find(params[:id])
  end

  def create
    # aDish = Dish.new()
    # aDish.name = params[:dish][:name1]
    # aDish.price = params[:dish][:price1]
    # aDish.dishtype = Dishtype.find(params[:dishtype][:name1])
    # aDish.menu = Menu.find(params[:id])

    # variable_name = ":name1"
    # instance_variable_set("@#{variable_name}", :something)

    elements = 999
    [1..elements].each do |e|
      
      aDish = Dish.new()
      aDish.name = params["dish"]["name1"]

      aDish.price = params["dish"]["price1"]
      aDish.dishtype = Dishtype.find(params["dish"]["dish1"])
      aDish.menu = Menu.find(params[:id])      
      if aDish.save
        flash[:notices] = ["Menu #{aDish.name} created successfully!"]
      else
        flash[:errors] = aDish.errors.full_messages
      end
      redirect_to dishes_new_path(params[:id])
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
