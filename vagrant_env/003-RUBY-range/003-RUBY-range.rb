# Go ahead and try the following methods:

# .include?(value) => true or false
# .last => returns the last object in range
# .max => returns the maximum value in range
# .min => returns the minimum value in range

aArray = (1..10)
bArray = ("a".."z")
cArray = [1..10]

puts aArray.class
puts bArray.class
puts cArray.class
    
puts aArray
puts bArray

puts aArray.include?(7)
puts aArray.last().to_s
puts bArray.max().to_s
puts aArray.min().to_s