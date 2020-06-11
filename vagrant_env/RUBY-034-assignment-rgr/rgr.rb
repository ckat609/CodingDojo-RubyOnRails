class Project
    attr_accessor :name, :description

    def initialize
    end

    def elevator_pitch
        return "#{name}, #{description}"
    end
end