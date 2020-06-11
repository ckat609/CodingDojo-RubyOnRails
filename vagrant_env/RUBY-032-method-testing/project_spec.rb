require_relative 'project' # include our Project class in our spec file
RSpec.describe Project do  
  before(:each) do
    # updated this block to create two projects
    @project1 = Project.new('Owner 1', 'Project 1', 'description 1', ['Task 1'])
    @project2 = Project.new('Owner 2', 'Project 2', 'description 2', ['Task 1'])
  end

  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
  end 

  it 'has a getter and setter for owner attribure' do
    @project1.owner = "Armando Tello"
    expect(@project1.owner).to eq("Armando Tello")
  end

  it 'has a tasks method' do
    expect(@project1.tasks).to eq(['Task 1'])
  end
  
  it 'has a task adder' do
    @project1.add_task('Task 2')
    expect(@project1.task).to eq(['Task 1', 'Task 2'])
  end

  it 'has a method elevator_pitch to explain name and description' do
    expect(@project1.elevator_pitch).to eq("Owner 1, Project 1, description 1")
    expect(@project2.elevator_pitch).to eq("Owner 2, Project 2, description 2")
  end
end