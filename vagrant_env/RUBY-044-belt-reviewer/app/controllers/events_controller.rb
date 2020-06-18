class EventsController < ApplicationController
  before_action :require_event_edit_permissions, only:[:edit, :destroy]

  def index
    @events = Event.all.order(date: :asc)
  end

  def new
  end

  def create
    @event = Event.new
    @event.name = events_params[:name]
    @event.city = events_params[:city]
    @event.state = events_params[:state]
    @event.date = events_params[:date]
    @event.user = current_user

    if @event.save
      flash[:notices] = ["#{@event.name} (#{@event.date}) in #{@event.city}, #{@event.state}"]
      redirect_to events_index_path
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to events_index_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
    puts "*"*50
    puts @event.inspect
    puts "*"*50
  end

  def update
    @event = Event.find(params[:id])
    @event.name = events_params[:name]
    @event.city = events_params[:city]
    @event.state = events_params[:state]
    @event.date = events_params[:date]
    @event.user = current_user
    
    if @event.save
      flash[:notices] = ["#{@event.name} (#{@event.date}) in #{@event.city}, #{@event.state}"]
      redirect_to events_show_path(@event.id)
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to events_edit_path
    end
  end

  def join
    @event = Event.find(params[:id])
    @event.users_attending << current_user
    redirect_to events_show_path(@event.id)
  end

  def cancel
    @event = Event.find(params[:id])
    @attending = Attending.where(user: current_user, event: @event).first.destroy
    redirect_to events_index_path
  end

  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to events_index_path
  end

  private

  def events_params
    params.require(:event).permit(:name, :date, :city, :state)
  end
end
