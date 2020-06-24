class CommentsController < ApplicationController
  def create
    aEvent = Event.find(params[:event_id])
    aComment = Comment.new
    aComment.comment = comment_params[:comment]
    aComment.event = aEvent
    aComment.user = current_user

    if aComment.save
      flash[:notice] = ["Comment added successfully!"]
      redirect_to events_show_path(params[:event_id])
    else
      flash[:errors] = ["Comment was not added."]
      redirect_to events_show_path(params[:event_id])
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :event_id)
    end
end
