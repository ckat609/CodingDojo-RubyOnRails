module MyEnumerable
    def my_each 
        for i in 0...self.length
            yield self[i]
        end
    end

    def my_any?
        for i in 0...self.length
            if yield self[i]
                return true
            end
            return false
        end
    end

    def my_collect
        aList = Array.new
        for i in self
            aList.push(yield i)
        end
        return aList
    end

    def my_detect
        for i in self
            if yield i
                return i
            end
        end
        return nil
    end

    def my_find_all
        aList = Array.new
        for i in self
            if yield i
                aList.push(i)
            end
        end
        return aList
    end

    def my_reject
        aList = Array.new
        for i in self
            unless yield i
                aList.push(i)
            end
        end
        return aList
    end
end

class Array
    include MyEnumerable
end
class Range
    include MyEnumerable
end

[9,6,1,5].my_each { |i| puts i} # => 1 2 3 4
[1,2,3,4].my_each { |i| puts i * 10 } # => 10 20 30 40

# .any? { |obj| block } => true or false
# e.g. ruby ["ant", "bear", "cat"].any? { |word| word.length >= 3 } # => true ```
puts ["ant", "bear", "cat"].my_any? { |word| word.length >= 3 }

# .collect { |obj| block } => returns a new array with the results of running block once for every element in enum
# e.g. ruby (1..4).collect { |i| i*i } # => [1, 4, 9, 16]
# e.g. ruby (1..4).collect { "cat" } # => ["cat", "cat", "cat", "cat"]
puts (1..4).my_collect{ |i| i*i }
puts (1..4).my_collect{ "cat" }

# .detect/.find => returns the first for which block is not false.
# e.g. ruby (1..10).detect { |i| i %5 == 0 and i % 7 == 0 } # => nil
# e.g. ruby (1..100).detect { |i| i %5 == 0 and i % 7 == 0 } # => 35
puts (1..10).my_detect { |i| i %5 == 0 and i % 7 == 0 }
puts (1..100).my_detect { |i| i %5 == 0 and i % 7 == 0 }

# .find_all { |obj| block } or .select { |obj| block } => returns an array containing all elements of enum for which block is not false
# e.g. ruby (1..10).find_all { |i| i % 3 == 0 } # => [3, 6, 9]
puts (1..10).my_find_all { |i| i % 3 == 0 }

# .reject { |obj| block } => opposite of find_all
# e.g. ruby (1..10).reject { |i| i % 3 == 0 } # => [1, 2, 4, 5, 7, 8, 10]
puts (1..10).reject { |i| i % 3 == 0 }