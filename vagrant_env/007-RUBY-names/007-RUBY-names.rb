a = {first_name: "Michael", last_name: "Choi"}
b = {first_name: "John", last_name: "Doe"}
c = {first_name: "Jane", last_name: "Doe"}
d = {first_name: "James", last_name: "Smith"}
e = {first_name: "Jennifer", last_name: "Smith"}
names = [a, b, c, d, e]
# Create a ruby method that goes over each name in the names array and prints something like below.

# You have 5 names in the 'names' array
# The name is 'Michael Choi'
# The name is 'John Doe'
# The name is 'Jane Doe'
# The name is 'James Smith'
# The name is 'Jennifer Smith'

def printNames(aList)
    # puts aList[:first_name]
    puts "You have #{aList.length} names in the 'names array"
    aList.each{|person| puts "My name is #{person[:first_name]} #{person[:last_name]}"}
end

printNames(names)