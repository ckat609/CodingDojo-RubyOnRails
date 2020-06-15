class LikesController < ApplicationController
  def create
    aSecret = Secret.find(params[:id])
    aLike = Like.where(user: current_user, secret: aSecret).first
    if (aLike)
      redirect_to likes_destroy_path(id: aSecret.id)#"/likes/destroy/#{aSecret.id}"
    else
      aSecret.likes << Like.new(user: current_user)
      redirect_to secrets_path
    end
  end

  def destroy
    aSecret = Secret.find(params[:id])
    aLike = Like.where(user: current_user, secret: aSecret).first
    aLike.destroy
    redirect_to secrets_path
  end

  private

  def secrets_params
    # params.require()
  end
end
