class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    aSecret = Secret.new(content: secrets_params[:content], user: current_user)

    unless aSecret.save
      flash[:errors] = aSecret.errors.full_messages
    else
      flash[:notices] = ["Secret successfully added!"]
    end

    redirect_to users_show_path
  end

  def destroy
    Secret.find(params[:id]).destroy
    redirect_to users_show_path
  end

  private

  def secrets_params
    params.require(:secret).permit(:content)
  end
end
