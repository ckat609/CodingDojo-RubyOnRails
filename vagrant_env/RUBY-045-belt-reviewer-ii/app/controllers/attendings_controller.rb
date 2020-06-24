class AttendingsController < ApplicationController
  def create
    aAttending = Attending.new
    aEvent = Event.find(params[:id])

    if Attending.where(user: current_user, event: aEvent).first
      flash[:errors] = ["You are already attending this event."]
    else
      flash[:notice] = ["You are attending #{aEvent.name}"]
      aAttending.user = current_user
      aAttending.event = aEvent
      aAttending.save
    end
    redirect_to events_index_path
  end

  def destroy
    aEvent = Event.find(params[:id])
    aAttending = Attending.where(user: current_user, event: aEvent).first
    if aAttending
      aAttending.destroy
      flash[:notice] = ["You were successfully taken off the list for #{aEvent.name}"]
    else
      flash[:errors] = ["You are not attending this event."]
    end
    redirect_to events_index_path
  end
end
