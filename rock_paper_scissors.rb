class RockPaperScissors
  def initialize
    @choices = ["rock", "paper", "scissors"]
  end

  def play_game
    puts "Welcome to Rock, Paper, Scissors!"
    print "Enter your choice (rock, paper, or scissors): "
    user_choice = gets.chomp.downcase

    if !@choices.include?(user_choice)
      puts "Invalid choice. Please choose rock, paper, or scissors."
      return
    end

    computer_choice = @choices.sample
    puts "Computer chose: #{computer_choice}"

    if user_choice == computer_choice
      puts "It's a draw!"
    elsif (user_choice == "rock" && computer_choice == "scissors") ||
          (user_choice == "paper" && computer_choice == "rock") ||
          (user_choice == "scissors" && computer_choice == "paper")
      puts "You win!"
    else
      puts "You lose!"
    end
  end
end

# Example usage:
game = RockPaperScissors.new
game.play_game
