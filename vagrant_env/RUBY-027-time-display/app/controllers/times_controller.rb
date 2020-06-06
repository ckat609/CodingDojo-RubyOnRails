class TimesController < ApplicationController
  def main
    redirect_to ("/times/show")
  end
  
  def new
  end
  
  def show
    @currentTimeDate = Time.now
  end
end
