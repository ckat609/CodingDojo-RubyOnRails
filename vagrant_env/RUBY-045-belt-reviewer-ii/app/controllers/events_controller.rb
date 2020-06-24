class EventsController < ApplicationController
  before_action :require_event_edit_permissions, only:[:edit, :destroy]

  def index
    @events = Event.all
  end

  def new
  end

  def create
    aEvent = Event.new
    aEvent.name = event_params[:name]
    aEvent.date = event_params[:date]
    aEvent.city = event_params[:city]
    aEvent.state = event_params[:state]
    aEvent.user = User.find(current_user.id)

    if aEvent.save
      flash[:notice] = ["Event added successfully: #{aEvent.name} in #{aEvent.city}, #{aEvent.state} on #{aEvent.date.strftime("%m-%d-%Y")} "]
      redirect_to events_show_path(aEvent.id)
    else
      flash[:errors] = aEvent.errors.full_messages
      redirect_to events_index_path
    end
  end

  def show
    @aEvent = Event.find(params[:id])
  end

  def edit
    @aEvent = Event.find(params[:id])
  end

  def update
    aEvent = Event.find(params[:id])
    aEvent.name = event_params[:name]
    aEvent.date = event_params[:date]
    aEvent.city = event_params[:city]
    aEvent.state = event_params[:state]
    aEvent.user = User.find(current_user.id)

    if aEvent.save
      flash[:notice] = ["Event modified successfully: #{aEvent.name} in #{aEvent.city}, #{aEvent.state} on #{aEvent.date.strftime("%m-%d-%Y")} "]
      redirect_to events_show_path(aEvent.id)
    else
      flash[:errors] = aEvent.errors.full_messages
      redirect_to events_index_path
    end
  end


  def destroy
    aEvent = Event.find(params[:id])
    aEvent.destroy
    redirect_to events_index_path
  end

  private
  
    def event_params
      params.require(:event).permit(:name, :date, :city, :state)
    end
end
