class Chatbot
  def initialize
    @responses = {
      "hello" => "Hi! How can I help you?",
      "how are you" => "I'm doing well, thank you for asking!",
      "bye" => "Goodbye! Have a great day!"
    }
  end

  def respond(input)
    response = @responses[input.downcase]
    if response
      puts response
    else
      puts "Sorry, I don't understand that."
    end
  end
end

# Example usage:
bot = Chatbot.new

puts "Start chatting with the bot! (Type 'bye' to quit)"
loop do
  print "You: "
  user_input = gets.chomp
  bot.respond(user_input)
  break if user_input.downcase == "bye"
end
