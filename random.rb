def prediction()
    answers = ['It is certain', 'It is decidedly so', 'Without a doubt','Yes, definitely', 'You may rely on it', 'As I see it, yes', 'Most likely', 'Outlook good', 'Yes', 'Signs point to yes', 'Reply hazy try again', 'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again', "Don't count on it", 'My reply is no', 'My sources say no', 'Outlook not so good', 'Very doubtful'];
    random = answers[(rand * answers.count).floor]
    puts "What's your question?"
    question = gets
    puts random
    puts "Do you have another question Y/N?"
    prediction() if gets.chomp.downcase == "y"
end

puts "Do you have a question for the Magic 8-Ball Y/N?"
prediction() if gets.chomp.downcase == "y"