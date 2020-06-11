class AppleTree
    attr_accessor :age

    def initialize
        @age = 0
        @height = 1
        @apple_count = 0
    end

    def getHeight
        return @height
    end

    def getAppleCount
        return @apple_count
    end

    def year_gone_by
        @age+=1
        @height*1.1
        if @age > 3 and @age <= 10
            @apple_count+=2
        end
        return true
    end

    def pick_apples
        @apple_count = 0
        return true
    end
end