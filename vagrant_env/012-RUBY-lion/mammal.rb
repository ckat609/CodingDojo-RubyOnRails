class Mammal
    attr_accessor :health

    def initialize health=150
        @health = health
        self
    end

    def display_health
        puts health
        self
    end
end

# animal = Mammal.new()
# puts animal.display_health