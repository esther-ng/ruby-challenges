number = 1
while (number <= 100)
    if (number%3 == 0 && number&5 == 0)
        puts "FizzBuzz"
    elsif (number%5 == 0)
        puts "Buzz"
    elsif (number%3 == 0)
        puts "Fizz"
    else
        puts number
    end
    number += 1
end