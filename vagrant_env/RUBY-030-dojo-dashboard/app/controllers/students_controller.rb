class StudentsController < ApplicationController
  def index
  end

  def new
    @aSelectedDojo = params[:id].to_i
    @aDojo = Dojo.all
  end

  def show
    @aStudent = Student.find(params[:id])

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def create
    @aStudent = Student.create(student_params)
    @aStudent.dojo = Dojo.find(params[:student][:dojo].to_i)
    @aStudent.save

    if @aStudent.valid?
      flash[:success] = "#{@aStudent.first_name} #{@aStudent.last_name} (#{@aStudent.email}), was added successfully to the #{@aStudent.dojo.branch} branch!"
      redirect_to "/"
    else
      flash[:error] = @aStudent.errors.full_messages
      redirect_to "/student/new"
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
