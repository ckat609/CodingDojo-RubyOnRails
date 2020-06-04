# Create an array with the following values: 3,5,1,2,7,9,8,13,25,32. Print the sum of all numbers in the array. Also have the function return an array that only include numbers that are greater than 10 (e.g. when you pass the array above, it should return an array with the values of 13,25,32 - hint: use reject or find_all method)
def puzzleOne(aList, aNumber)
    sum = 0
    bList = []
    aList.each{|x| sum+=x; bList.push(x) if x > aNumber}
    puts sum

    return bList.to_s
end
puts(puzzleOne([3,5,1,2,7,9,8,13,25,32], 10))

# Create an array with the following values: John, KB, Oliver, Cory, Matthew, Christopher. Shuffle the array and print the name of each person. Have the program also return an array with names that are longer than 5 characters.
def shuffleArray(aList, aNumber)
    bList = []
    aList.each{|x| bList.push(x) if x.length > aNumber}
    puts aList.shuffle.to_s

    return bList.to_s
end
puts(shuffleArray(["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"], 5))


# Create an array that contains all 26 letters in the alphabet (this array must have 26 values). Shuffle the array and display the last letter of the array. Have it also display the first letter of the array. If the first letter in the array is a vowel, have it display a message.
def alphabet()
    aList = []
    vowels = ['a','e','i','o','u']
    ("a".."z").each{|x| aList.push(x)}
    aList.shuffle!

    puts "first: #{aList[0]}"
    puts "last: #{aList[aList.length-1]}"
    puts "The first letter is a vowel!"if vowels.include?aList[0]

    return aList.to_s
end
puts(alphabet())

# Generate an array with 10 random numbers between 55-100.
def randomArray(aRange, aNumber)
    aList = []
    (1..aNumber).each{|x| aList.push(rand(aRange))}
    return aList.to_s
end
puts randomArray(55..100, 10)


# Generate an array with 10 random numbers between 55-100 and have it be sorted (showing the smallest number in the beginning). Display all the numbers in the array. Next, display the minimum value in the array as well as the maximum value

def randomSortedArray(aRange, aNumber)
    aList = []
    (1..aNumber).each{|x| aList.push(rand(aRange))}
    puts "Min: #{aList.min}"
    puts "Max: #{aList.max}"
    return aList.sort!.to_s
end
puts randomSortedArray(55..100, 10)

# Create a random string that is 5 characters long (hint: (65+rand(26)).chr returns a random character)
def randomString(aNumber)
    aString = ""
    (1..aNumber).each{|x| aString+=(rand(65..90)).chr}
    return aString
end
puts randomString(10)

# Generate an array with 10 random strings that are each 5 characters long
def randomStringArray(numStrings, numLength)
    aList = []
    aString = ""
    (0...numStrings).each{|y|
        aList.push((0...numLength).each{|x| 
        aString+=rand(65..90).chr
        aString})
    aString=""}
    # for i in 0...numStrings
    #     aString = ""
    #     (1..numLength).each{|x| aString+=(rand(65..90)).chr}
    #     aList[i] = aString
    # end
    
    return aList.to_s
end
puts randomStringArray(10,5)