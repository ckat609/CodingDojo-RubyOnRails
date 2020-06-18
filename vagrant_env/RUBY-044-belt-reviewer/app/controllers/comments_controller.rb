class CommentsController < ApplicationController
  def create
    aComment = Comment.new
    aComment.comment = comment_params[:comment]
    aComment.event = Event.find(params[:event_id])
    aComment.user = current_user

    if aComment.save
      flash[:notices] = ["Comment added successfully!"]
    else
      flash[:errors] = aComment.errors.full_messages
    end
    redirect_to events_show_path(params[:event_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :event_id)
  end
end
