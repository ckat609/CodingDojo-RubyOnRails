require_relative 'human.rb'

class Wizard < Human
    def initialize
        super
        @health = 50
        @intelligence = 25
        self
    end

    def heal
        @health+=10
        self
    end

    def fireball opponent
        if opponent.class.ancestors.include?Human
            opponent.attacked(20)
        end
        self
    end
end

class Ninja < Human
    def initialize
        super
        @stealth = 175
        self
    end

    def steal opponent
        if opponent.class.ancestors.include?Human
            @health+=10
            opponent.attacked(@strength)
        end
        self
    end

    def get_away
        @health+=15
        self
    end
end

class Samurai < Human
    @@total_samurai = 0
    def initialize
        super
        @health = 200
        @@total_samurai+=1
        self
    end

    def death_blow opponent
        if opponent.class.ancestors.include?Human
            opponent.attacked(opponent.health)
        end
        self
    end

    def meditate
        if @health < 200
            @health += (200-@health)
        end
        self
    end

    def how_many
        return @@total_samurai
    end
end

aWizard = Wizard.new
aNinja = Ninja.new
aSamurai = Samurai.new
anotherSamurai = Samurai.new
aNinja.showStats
aWizard.showStats
aSamurai.showStats

aWizard.fireball(aNinja).heal.showStats
aNinja.showStats

aNinja.steal(aWizard).get_away.showStats
aWizard.showStats

aWizard.fireball(aSamurai)
aSamurai.death_blow(aNinja).showStats
aNinja.showStats
aSamurai.meditate.showStats

puts aSamurai.how_many