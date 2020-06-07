class SurveysController < ApplicationController
  def index
    unless session.include?("count")
      session['count']=0
    end
    @dojos = Dojo.all
    @languages = Language.all
  end

  def create
    aDojo = Dojo.find(params[:survey][:dojo])
    aLanguage = Language.find(params[:survey][:language])
    Survey.create(first_name: params[:survey][:first_name], last_name: params[:survey][:last_name], comment: params[:survey][:comment], language: aLanguage, dojo: aDojo)
    
    session['count']+=1
    flash['success'] = "Thanks for submitting this form!  You have submitted this form #{session['count']} times now"
    redirect_to "/surveys/show"
  end
  
  def show
    @survey = Survey.last
  end
  
  private

  def survey_params
    puts aDojo
    puts aLanguage
    # params.require(:survey).permit(:first_name, :last_name, :comment, :dojo => :dojot)
  end
end
