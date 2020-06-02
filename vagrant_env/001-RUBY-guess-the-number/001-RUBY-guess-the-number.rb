def guess_number(aNumber)
    aGuess = 25
    if aNumber == aGuess
        puts "You guess correctly! :)"
    elsif aNumber <  aGuess
        puts "Too low! :("
    else
        puts "Too high! :p"
    end
end

guess_number(2)
guess_number(35)
guess_number(25)