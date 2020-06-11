class Project
    attr_accessor :owner, :name, :description, :task
    def initialize owner, name, description, task
      @owner = owner
      @name = name
      @description = description
      @task = task
    end

    def elevator_pitch
      "#{@owner}, #{@name}, #{@description}"
    end

    def 

    def tasks
      return @task
    end

    def add_task aTask
      @task<<aTask
    end
  end