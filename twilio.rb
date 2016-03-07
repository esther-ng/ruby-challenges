require 'rubygems'
require 'twilio-ruby'

account_sid = "AC64d94ab16e0e09ced55e0b99a71372af"
auth_token = "b8ae4d72ab3c19739ea61eb57adea872"

@client = Twilio::REST::Client.new("AC64d94ab16e0e09ced55e0b99a71372af","b8ae4d72ab3c19739ea61eb57adea872")

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

message = @client.account.messages.create(
    :from => "+15102552221",
    :to => "+15107176459",
    :body => "Do you have a question for the Magic 8-Ball Y/N?"
)

puts message.to

