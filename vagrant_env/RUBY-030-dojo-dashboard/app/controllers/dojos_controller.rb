class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new

  end

  def show
  end

  def edit
  end

  def create
    @aNewDojo = Dojo.create(dojo_params)
    
    if @aNewDojo.valid?
      flash[:success] = "#{params[:dojo][:branch]} Dojo - #{params[:dojo][:street]} #{params[:dojo][:city]},#{params[:dojo][:state]} was added successfully!"
      redirect_to "/"
    else
      flash[:error] = @aNewDojo.errors.full_messages
      redirect_to "/dojos/new"
    end
  end

  def update
  end

  def destroy
  end

  private

  def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
end
