class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def create
    @message = Message.new(message_params)
    
    if @message.save
      User.find(session['user_id']).messages << @message
      flash[:notices] = ["Message added successfully"]
    else
      flash[:errors] = @message.errors.full_messages
    end
    redirect_to messages_index_path
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
