class Mammal
    attr_accessor :health

    def initialize health=150
        @health = health
        self
    end

    def display_health
        return health
    end
end

# animal = Mammal.new()
# puts animal.display_health