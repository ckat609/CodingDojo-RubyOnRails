require_relative 'mammal.rb'

class Dog < Mammal
    def pet
        @health+=5
        self
    end

    def walk
        @health-=1
        self
    end

    def run
        @health-=10
        self
    end
end


chuchu = Dog.new()
puts chuchu.walk.walk.walk.run.run.pet.display_health
puts chuchu.display_health