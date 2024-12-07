class Flashcard
  attr_accessor :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end

class FlashcardQuiz
  def initialize
    @flashcards = []
  end

  def add_flashcard(flashcard)
    @flashcards << flashcard
  end

  def take_quiz
    score = 0
    @flashcards.each_with_index do |flashcard, index|
      puts "#{index + 1}. #{flashcard.question}"
      print "Your answer: "
      answer = gets.chomp

      if answer.downcase == flashcard.answer.downcase
        score += 1
        puts "Correct!"
      else
        puts "Incorrect. The correct answer is: #{flashcard.answer}"
      end
    end
    puts "You scored #{score} out of #{@flashcards.length}"
  end
end

# Example usage:
quiz = FlashcardQuiz.new

# Add flashcards
quiz.add_flashcard(Flashcard.new("What is the capital of France?", "Paris"))
quiz.add_flashcard(Flashcard.new("What is 5 + 3?", "8"))
quiz.add_flashcard(Flashcard.new("Who wrote '1984'?", "George Orwell"))

# Take the quiz
quiz.take_quiz
