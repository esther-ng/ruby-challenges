require 'rubygems'
require 'twilio-ruby'

account_sid = "AC64d94ab16e0e09ced55e0b99a71372af"
auth_token = "b8ae4d72ab3c19739ea61eb57adea872"

@client = Twilio::REST::Client.new("AC64d94ab16e0e09ced55e0b99a71372af","b8ae4d72ab3c19739ea61eb57adea872")

answers = ['It is certain', 'It is decidedly so', 'Without a doubt','Yes, definitely', 'You may rely on it', 'As I see it, yes', 'Most likely', 'Outlook good', 'Yes', 'Signs point to yes', 'Reply hazy try again', 'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again', "Don't count on it", 'My reply is no', 'My sources say no', 'Outlook not so good', 'Very doubtful'];
random = answers[Math.floor(Math.random() * answers.length)]

message = @client.account.messages.create(
    :from => "+15102552221",
    :to => "+15107176459",
    :body => random
)

puts message.to

