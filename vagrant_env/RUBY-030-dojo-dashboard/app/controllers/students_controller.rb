class StudentsController < ApplicationController
  def index
  end

  def new
    @aSelectedDojo = params[:dojo_id].to_i
    @aDojo = Dojo.all
  end

  def show
    @aStudent = Student.find(params[:id])
  end
  
  def update
    @aStudent = Student.find(params[:id])
    @aStudent.first_name = student_params[:first_name]
    @aStudent.last_name = student_params[:last_name]
    @aStudent.email = student_params[:email]
    @aStudent.dojo = Dojo.find(student_params[:dojo])
    @aStudent.save

    if @aStudent.valid?
      flash[:success] = "#{@aStudent.first_name} #{@aStudent.last_name} (#{@aStudent.email}) in #{@aStudent.dojo.branch} was edited successfully!"
      puts "*"*50
      puts @aStudent.inspect
      puts "*"*50
      redirect_to "/"
    else
      flash[:error] = @aStudent.errors.full_messages
      redirect_to "/students/#{@aStudent.id}/edit"
    end
  end

  def edit
    @aStudent = Student.find(params[:id])
    @aDojo = Dojo.all
  end

  def destroy
    @aStudent = Student.find(params[:id])
    dojo_id = @aStudent.dojo.id
    @aStudent.destroy
    redirect_to dojo_url(dojo_id)
  end

  def create
    @aStudent = Student.create(first_name: student_params[:first_name], last_name: student_params[:last_name], email: student_params[:email], dojo: Dojo.find(student_params[:dojo]))

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
    params.require(:student).permit(:first_name, :last_name, :email, :dojo)
  end
end
