# Create a MathDojo class that will allow you to add and subtract numbers.

# challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result # => 4
# challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result # => 23.15
# Hint
# Practice method chaining
# Use the Splat Operator (splat operator)

# You can use the splat operator when you are not sure how many arguments your methods are going to pass in. For example:

# def splatting *params
#  params
# end
# puts splatting(1).inspect # => [1]
# puts splatting(1, 2, 3, 4, 5).inspect # => [1, 2, 3, 4, 5]
# => All the arguments are condensed into a single array.

class MathDojo
    attr_accessor :args, :sumAll
    def initialize
        @sumAll = 0
        self
    end

    def add *args
        (args[0].is_a?Array)?args[0].each {|x| @sumAll+=x}:args.each {|x| @sumAll+=x}
        self
    end

    def sub *args
        (args[0].is_a?Array)?args[0].each {|x| @sumAll-=x}:args.each {|x| @sumAll-=x}
        self
    end

    def get_sum
        return @sumAll
    end
end

sum1 = MathDojo.new().add([1,2,3,4,5]).add(1,2,3,4,5).sub(2,4,6).sub([2,4,6]).add(100).add([50]).sub(50).sub([50])
puts sum1.get_sum
sum2 = MathDojo.new().add(6,7,8,9,10).add([6,7,8,9,10]).sub(2,4,6).sub([2,4,6]).add(100).add([50]).sub(50).sub([50])
puts sum2.get_sum
