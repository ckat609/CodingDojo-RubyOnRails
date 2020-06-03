class Human
    attr_accessor :strength, :intelligence, :stealth, :health

    def initialize
        @strength = 3
        @intelligence = 3
        @stealth = 3
        @health = 100
    end

    def attacked damage
        if self.class.ancestors.include?Human
            @health-=damage
        end
    end

    def getHealth
        return @health
    end

    def showStats
        puts "*"*50
        puts self.class
        puts "Health: #{@health}"
        puts "Strength: #{@strength}"
        puts "Intelligence: #{@intelligence}"
        puts "Stealth: #{@stealth}"
        puts "*"*50
    end
end

# person1 = Human.new
# person2 = Human.new

# person1. showInfo
# person2. showInfo

# person1.attack person2

# person1. showInfo
# person2. showInfo