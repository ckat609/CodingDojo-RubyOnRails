class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new

  end

  def show
    @aDojo = Dojo.find(params[:id])
  end

  def edit
    @aDojo = Dojo.find(params[:id])
  end

  def create
    @aNewDojo = Dojo.create(dojo_params)
    
    if @aNewDojo.valid?
      flash[:success] = "#{@aNewDojo.branch} Dojo - #{@aNewDojo.street} #{@aNewDojo.city},#{@aNewDojo.state} was added successfully!"
      redirect_to "/"
    else
      flash[:error] = @aNewDojo.errors.full_messages
      redirect_to "/dojos/new"
    end
  end

  def update
    @aNewDojo = Dojo.find(params[:id])
    @aNewDojo.branch = dojo_params[:branch]
    @aNewDojo.street = dojo_params[:street]
    @aNewDojo.city = dojo_params[:city]
    @aNewDojo.state = dojo_params[:state]
    @aNewDojo.save

    puts "*"*50
    puts @aNewDojo.inspect
    puts "*"*50
    
    if @aNewDojo.valid?
      flash[:success] = "#{@aNewDojo.branch} Dojo - #{@aNewDojo.street} #{@aNewDojo.city},#{@aNewDojo.state} was edited successfully!"
      redirect_to "/"
    else
      flash[:error] = @aNewDojo.errors.full_messages
      redirect_to "/dojos/#{@aNewDojo.id}/edit"
    end
  end

  def destroy
    @aDojo = Dojo.find(params[:id])
    @aDojo.destroy
    redirect_to main_dojo_url()
  end

  private

  def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end
end
