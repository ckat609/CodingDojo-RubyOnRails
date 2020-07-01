class DishtypesController < ApplicationController
  def index
  end
  
  def new
    @dishtypes = Dishtype.all
  end

  def create
    aDishtype = Dishtype.new()
    aDishtype.name = dishtype_params[:name]
    aDishtype.menu = Menu.find(dishtype_params[:menu])

    if aDishtype.save
      flash[:notices] = ["Dishtype #{aDishtype.name} created successfully!"]
    else
      flash[:errors] = aDishtype.errors.full_messages
    end
    redirect_to dishtypes_new_path
  end

  def show
  end

  def edit
    @dishtype = Dishtype.find(params[:id])
    @dishtypes = Dishtype.all.order(:name)
  end

  def update
    aDishtype = Dishtype.find(params[:id])
    aDishtype.name = dishtype_params[:name]

    if aDishtype.save
      flash[:notices] = ["#{aDishtype.name} menu modified successfully!"]
      redirect_to dishtypes_index_path
    else
      flash[:errors] = aDishtype.errors.full_messages
      redirect_to dishtypes_new_path
    end
  end

  def destroy
    @dishtype = Dishtype.find(params[:id])
    @dishtype.destroy
    flash[:notices] = ["Dishtype #{@dishtype.name} removed successfully!"]
    redirect_to dishtype_new_path
  end

  private
    def dishtype_params
      params.require(:dishtype).permit(:name, :menu)
    end
end
