# .at or .fetch
# .delete
# .reverse
# .length
# .sort
# .slice
# .shuffle
# .join
# .insert
# values_at() -> returns an array with values specified in the param
# e.g. a = %w{cat dog bear}; puts a.values_at(1,2).join(' and ') #=> "dog and bear"

aArray = [9,2,7,4,5,3,7,1,6]
bArray = ["a", "b", "c", "d", "e", "f", "g"]
puts aArray.at(3).to_s
puts aArray.delete(3).to_s
puts aArray.reverse().to_s
puts aArray.length()
puts aArray.to_s
puts aArray.sort()
puts aArray.slice(0)
puts aArray.shuffle().to_s
puts aArray.join("-").to_s
puts aArray.insert(4, "caca").to_s
puts aArray.values_at(1,2).join("sho").to_s